module HW.Template.Advertising
  ( advertisingTemplate
  )
where

import qualified HW.Template.Base
import qualified HW.Type.BaseUrl
import qualified HW.Type.Route
import qualified Lucid as Html

advertisingTemplate :: HW.Type.BaseUrl.BaseUrl -> Html.Html ()
advertisingTemplate baseUrl =
  HW.Template.Base.baseTemplate baseUrl "Advertising :: Haskell Weekly" mempty
    $ do
        Html.h2_ [Html.class_ "f2 mv3 tracked-tight"] "Advertising"
        Html.h3_ [Html.class_ "f3 mv3 tracked-tight"] "Newsletter"
        Html.p_ $ do
          "You can advertise with Haskell Weekly by purchasing a sponsored link. "
          "Sponsored links are similar to featured links except that they say '(ad)' after the title. "
          "Here's an example of how they look: "
        Html.ul_ . Html.li_ $ do
          Html.p_ $ do
            Html.a_
              [ Html.href_ $ HW.Type.Route.routeToTextWith
                  baseUrl
                  HW.Type.Route.RouteAdvertising
              ]
              "Reach an engaged audience by advertising with Haskell Weekly!"
            " (ad)"
          Html.p_ $ do
            "As of May 2019, over 3,300 people subscribe to Haskell Weekly. "
            "Over the last five issues, the average open rate was 50% and the average click rate was 21%."
        Html.p_ "Each sponsored link has three required pieces:"
        Html.ol_ $ do
          Html.li_ . Html.p_ $ do
            "URL: This can be whatever you want. "
            "We recommend using a URL that will allow you to track engagement."
          Html.li_ $ Html.p_ "Title: This is up to 80 characters of plain text."
          Html.li_ . Html.p_ $ do
            "Copy: This is up to 300 characters of plain text. "
            "It can include basic Markdown formatting."
        Html.p_ $ do
          "Haskell Weekly is published at 10 AM ET every Thursday. "
          "Sponsored links must be submitted 24 hours before publication."
        Html.p_ $ do
          "Sponsored links cost US$60 per issue. "
          "A 25% bulk discount is available if you buy 4 or more links. "
          "Payment is accepted through Square. "
          "If you are interested in advertising with Haskell Weekly, please reach out to "
          Html.a_
            [Html.href_ "mailto:info@haskellweekly.news"]
            "info@haskellweekly.news"
          "."
        Html.h3_ [Html.class_ "f3 mv3 tracked-tight"] "Podcast"
        Html.p_ "We are not currently accepting advertising for the podcast."
