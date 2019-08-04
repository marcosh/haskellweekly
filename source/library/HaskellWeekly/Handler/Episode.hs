module HaskellWeekly.Handler.Episode
  ( episodeHandler
  )
where

import qualified Data.Map
import qualified Data.Text
import qualified HaskellWeekly.Episodes
import qualified HaskellWeekly.Handler.Base
import qualified HaskellWeekly.Template.Base
import qualified HaskellWeekly.Type.Episode
import qualified HaskellWeekly.Type.EpisodeNumber
import qualified HaskellWeekly.Type.Title
import qualified Lucid
import qualified Network.HTTP.Types
import qualified Network.Wai

episodeHandler
  :: HaskellWeekly.Type.EpisodeNumber.EpisodeNumber -> IO Network.Wai.Response
episodeHandler episodeNumber = case HaskellWeekly.Episodes.episodes of
  Left problem -> fail problem
  Right episodes -> pure $ case Data.Map.lookup episodeNumber episodes of
    Nothing -> HaskellWeekly.Handler.Base.notFoundResponse
    Just episode ->
      HaskellWeekly.Handler.Base.htmlResponse Network.HTTP.Types.ok200 []
        $ html episode

html :: HaskellWeekly.Type.Episode.Episode -> Lucid.Html ()
html episode =
  HaskellWeekly.Template.Base.baseTemplate ["Podcast", title episode] $ do
    Lucid.h2_ [Lucid.class_ $ Data.Text.pack "f2"] $ Lucid.toHtml "Podcast"
    Lucid.h3_ [Lucid.class_ $ Data.Text.pack "f3"] . Lucid.toHtml $ title
      episode
    Lucid.p_ $ Lucid.toHtml "TODO"

title :: HaskellWeekly.Type.Episode.Episode -> String
title =
  HaskellWeekly.Type.Title.titleToString
    . HaskellWeekly.Type.Episode.episodeTitle