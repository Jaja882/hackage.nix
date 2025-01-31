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
      identifier = { name = "X11"; version = "1.2.3"; };
      license = "BSD-3-Clause";
      copyright = "Alastair Reid, 1999-2003, libraries@haskell.org 2003-2007";
      maintainer = "Don Stewart <dons@galois.com";
      author = "";
      homepage = "";
      url = "";
      synopsis = "A binding to the X11 graphics library";
      description = "A Haskell binding to the X11 graphics library.\n\nThe binding is a direct translation of the C binding; for\ndocumentation of these calls, refer to \"The Xlib Programming\nManual\", available online at <http://tronche.com/gui/x/xlib/>.";
      buildType = "Configure";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (errorHandler.buildDepError "base")) ];
        libs = [ (pkgs."X11" or (errorHandler.sysDepError "X11")) ];
        buildable = true;
        };
      };
    }