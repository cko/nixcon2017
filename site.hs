  --------------------------------------------------------------------------------
  {-# LANGUAGE OverloadedStrings #-}
  import           Data.Monoid (mappend)
  import           Hakyll


  --------------------------------------------------------------------------------
  main :: IO ()
  main = hakyll $ do
      match "materialize/**/*" $ do
          route idRoute
          compile copyFileCompiler

      match "images/*" $ do
          route   idRoute
          compile copyFileCompiler

      match "js/*" $ do
              route   idRoute
              compile copyFileCompiler

      match "fonts/**/*" $ do
              route   idRoute
              compile copyFileCompiler

      match "css/*" $ do
          route   idRoute
          compile compressCssCompiler

      match (fromList ["impressum.md"]) $ do
          route   $ setExtension "html"
          compile $ pandocCompiler
              >>= loadAndApplyTemplate "templates/default.html" defaultContext
              >>= relativizeUrls

      match "*.html" $ do
          route idRoute
          compile $ do
              getResourceBody
                  >>= loadAndApplyTemplate "templates/default.html" defaultContext
                  >>= relativizeUrls

      match "templates/*" $ compile templateBodyCompiler


  --------------------------------------------------------------------------------
  postCtx :: Context String
  postCtx =
      dateField "date" "%B %e, %Y" `mappend`
      defaultContext
