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
      specVersion = "0";
      identifier = { name = "HPDF"; version = "1.0"; };
      license = "LicenseRef-LGPL";
      copyright = "Copyright (c) 2007, alpheccar";
      maintainer = "misc@NOSPAMalpheccar.org";
      author = "";
      homepage = "http://www.alpheccar.org/en/posts/show/80";
      url = "";
      synopsis = "Generation of PDF documents";
      description = "A PDF library allowing to generate multipage PDF documents with outlines, links ...";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."haskell98" or (errorHandler.buildDepError "haskell98"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."encoding" or (errorHandler.buildDepError "encoding"))
          (hsPkgs."zlib" or (errorHandler.buildDepError "zlib"))
          ];
        buildable = true;
        };
      };
    }