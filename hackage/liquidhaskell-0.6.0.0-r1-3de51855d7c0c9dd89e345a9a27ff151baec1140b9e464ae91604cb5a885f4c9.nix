let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { devel = false; include = false; };
    package = {
      specVersion = "1.18";
      identifier = { name = "liquidhaskell"; version = "0.6.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2010-15 Ranjit Jhala, University of California, San Diego.";
      maintainer = "Ranjit Jhala <jhala@cs.ucsd.edu>";
      author = "Ranjit Jhala, Niki Vazou, Eric Seidel";
      homepage = "http://goto.ucsd.edu/liquidhaskell";
      url = "";
      synopsis = "Liquid Types for Haskell";
      description = "Liquid Types for Haskell.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."ghc" or (buildDepError "ghc"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."hpc" or (buildDepError "hpc"))
          (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."cpphs" or (buildDepError "cpphs"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."deepseq" or (buildDepError "deepseq"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."Diff" or (buildDepError "Diff"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."ghc-paths" or (buildDepError "ghc-paths"))
          (hsPkgs."hscolour" or (buildDepError "hscolour"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."hashable" or (buildDepError "hashable"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."liquid-fixpoint" or (buildDepError "liquid-fixpoint"))
          (hsPkgs."located-base" or (buildDepError "located-base"))
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."fingertree" or (buildDepError "fingertree"))
          (hsPkgs."Cabal" or (buildDepError "Cabal"))
          (hsPkgs."bifunctors" or (buildDepError "bifunctors"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          ];
        buildable = true;
        };
      exes = {
        "liquid" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."liquid-fixpoint" or (buildDepError "liquid-fixpoint"))
            (hsPkgs."located-base" or (buildDepError "located-base"))
            (hsPkgs."liquidhaskell" or (buildDepError "liquidhaskell"))
            ];
          buildable = true;
          };
        "lhi" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ghc" or (buildDepError "ghc"))
            (hsPkgs."cmdargs" or (buildDepError "cmdargs"))
            (hsPkgs."deepseq" or (buildDepError "deepseq"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."liquid-fixpoint" or (buildDepError "liquid-fixpoint"))
            (hsPkgs."located-base" or (buildDepError "located-base"))
            (hsPkgs."liquidhaskell" or (buildDepError "liquidhaskell"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."unix" or (buildDepError "unix"))
            (hsPkgs."daemons" or (buildDepError "daemons"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."process" or (buildDepError "process"))
            ];
          buildable = true;
          };
        };
      tests = {
        "test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."optparse-applicative" or (buildDepError "optparse-applicative"))
            (hsPkgs."stm" or (buildDepError "stm"))
            (hsPkgs."tagged" or (buildDepError "tagged"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-ant-xml" or (buildDepError "tasty-ant-xml"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            (hsPkgs."tasty-rerun" or (buildDepError "tasty-rerun"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            ];
          buildable = true;
          };
        };
      };
    }