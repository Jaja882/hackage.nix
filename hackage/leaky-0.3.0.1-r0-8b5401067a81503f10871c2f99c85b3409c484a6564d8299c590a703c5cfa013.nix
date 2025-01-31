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
    flags = {
      hello_hackage_visitor = false;
      turn_on_seqaid_plugin = true;
      omnitypic = false;
      test_seqaidpp = true;
      stats = true;
      using_sandbox = false;
      use_second_module = true;
      profile = false;
      use_growing_list = true;
      use_growing_list_reduction = true;
      use_infinite_list = false;
      use_strict_blob = true;
      use_cpphs = false;
      cowboy = false;
      };
    package = {
      specVersion = "1.18";
      identifier = { name = "leaky"; version = "0.3.0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Andrew Seniuk <rasfar@gmail.com>";
      author = "Andrew G. Seniuk";
      homepage = "http://fremissant.net/leaky";
      url = "";
      synopsis = "Robust space leak, and its strictification";
      description = "Robust space leak, and its strictification, for testing <http://hackage.haskell.org/package/deepseq-bounded deepseq-bounded> and <http://hackage.haskell.org/package/seqaid seqaid>.\n\nSee also the project <http://www.fremissant.net/leaky homepage> for more information.\n\nPlease share your comments on this <http://www.reddit.com/r/haskell/comments/2pscxh/ann_deepseqbounded_seqaid_leaky/ reddit> discussion.\n\nNOTE: /Ignore the anonymous rogue failed build report below. If you examine the log it's clear that the problem is theirs, and nothing to do with this package or its dependencies. It's a shame this is so prominently displayed and impossible to remedy, it makes unbroken packages seem broken to visitors, and it exerts negative pressure on the use of cpphs and other build-tools./";
      buildType = "Simple";
      };
    components = {
      exes = {
        "leaky" = {
          depends = ([
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."deepseq-bounded" or (errorHandler.buildDepError "deepseq-bounded"))
            (hsPkgs."deepseq-generics" or (errorHandler.buildDepError "deepseq-generics"))
            (hsPkgs."generics-sop" or (errorHandler.buildDepError "generics-sop"))
            (hsPkgs."template-haskell" or (errorHandler.buildDepError "template-haskell"))
            (hsPkgs."seqaid" or (errorHandler.buildDepError "seqaid"))
            ] ++ (pkgs.lib).optional (flags.use_cpphs) (hsPkgs."cpphs" or (errorHandler.buildDepError "cpphs"))) ++ (pkgs.lib).optional (flags.omnitypic) (hsPkgs."ghc-prim" or (errorHandler.buildDepError "ghc-prim"));
          build-tools = [
            (hsPkgs.buildPackages.cpphs or (pkgs.buildPackages.cpphs or (errorHandler.buildToolDepError "cpphs")))
            ];
          buildable = true;
          };
        };
      };
    }