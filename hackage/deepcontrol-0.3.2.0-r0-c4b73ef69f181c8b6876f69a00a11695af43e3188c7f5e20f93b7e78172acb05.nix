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
    flags = {};
    package = {
      specVersion = "1.10";
      identifier = { name = "deepcontrol"; version = "0.3.2.0"; };
      license = "BSD-3-Clause";
      copyright = "KONISHI Yohsuke";
      maintainer = "ocean0yohsuke@gmail.com";
      author = "KONISHI Yohsuke";
      homepage = "https://github.com/ocean0yohsuke/deepcontrol";
      url = "";
      synopsis = "Provide more deeper level style of programming than the usual Control.xxx modules express";
      description = "This module enables more deeper level style of programming than the usual Control.xxx modules express, especially for Applicative and Monad.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."mmorph" or (buildDepError "mmorph"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = true;
        };
      tests = {
        "doctests" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            ];
          buildable = true;
          };
        "unit_Applicative" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."deepcontrol" or (buildDepError "deepcontrol"))
            ];
          buildable = true;
          };
        "unit_Commutative" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."deepcontrol" or (buildDepError "deepcontrol"))
            ];
          buildable = true;
          };
        "unit_Monad" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."deepcontrol" or (buildDepError "deepcontrol"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."safe" or (buildDepError "safe"))
            ];
          buildable = true;
          };
        "unit_Monad-Level1" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."deepcontrol" or (buildDepError "deepcontrol"))
            ];
          buildable = true;
          };
        "unit_Monad-Level2" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."deepcontrol" or (buildDepError "deepcontrol"))
            ];
          buildable = true;
          };
        "unit_Monad-Level2-2" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."deepcontrol" or (buildDepError "deepcontrol"))
            ];
          buildable = true;
          };
        "unit_MonadTrans" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."deepcontrol" or (buildDepError "deepcontrol"))
            ];
          buildable = true;
          };
        "unit_MonadMorph" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HUnit" or (buildDepError "HUnit"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."deepcontrol" or (buildDepError "deepcontrol"))
            ];
          buildable = true;
          };
        };
      };
    }