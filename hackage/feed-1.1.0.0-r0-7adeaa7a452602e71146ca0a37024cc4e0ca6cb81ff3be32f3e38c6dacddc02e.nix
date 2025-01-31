{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = {};
    package = {
      specVersion = "1.8";
      identifier = { name = "feed"; version = "1.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Adam Bergmark <adam@bergmark.nl>";
      author = "Sigbjorn Finne <sof@forkIO.com>";
      homepage = "https://github.com/bergmark/feed";
      url = "";
      synopsis = "Interfacing with RSS (v 0.9x, 2.x, 1.0) + Atom feeds.";
      description = "Interfacing with RSS (v 0.9x, 2.x, 1.0) + Atom feeds.\n\nTo help working with the multiple feed formats we've\nended up with, this set of modules provides parsers,\npretty printers and some utility code for querying\nand just generally working with a concrete representation\nof feeds in Haskell.\n\nSee here for an example of how to create an Atom feed:\n<https://github.com/bergmark/feed/blob/master/tests/Example/CreateAtom.hs>\n\nFor basic reading and editing of feeds, consult\nthe documentation of the Text.Feed.* hierarchy.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."old-locale" or (errorHandler.buildDepError "old-locale"))
          (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
          (hsPkgs."safe" or (errorHandler.buildDepError "safe"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."time" or (errorHandler.buildDepError "time"))
          (hsPkgs."time-locale-compat" or (errorHandler.buildDepError "time-locale-compat"))
          (hsPkgs."utf8-string" or (errorHandler.buildDepError "utf8-string"))
          (hsPkgs."xml-types" or (errorHandler.buildDepError "xml-types"))
          (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
          ];
        buildable = true;
        };
      tests = {
        "tests" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."feed" or (errorHandler.buildDepError "feed"))
            (hsPkgs."old-time" or (errorHandler.buildDepError "old-time"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."time" or (errorHandler.buildDepError "time"))
            (hsPkgs."xml-types" or (errorHandler.buildDepError "xml-types"))
            (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
            ];
          buildable = true;
          };
        "readme" = {
          depends = [
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."base-compat" or (errorHandler.buildDepError "base-compat"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."xml-types" or (errorHandler.buildDepError "xml-types"))
            (hsPkgs."feed" or (errorHandler.buildDepError "feed"))
            (hsPkgs."xml-conduit" or (errorHandler.buildDepError "xml-conduit"))
            (hsPkgs."xml-types" or (errorHandler.buildDepError "xml-types"))
            ];
          build-tools = [
            (hsPkgs.buildPackages.markdown-unlit or (pkgs.buildPackages.markdown-unlit or (errorHandler.buildToolDepError "markdown-unlit")))
            ];
          buildable = true;
          };
        };
      };
    }