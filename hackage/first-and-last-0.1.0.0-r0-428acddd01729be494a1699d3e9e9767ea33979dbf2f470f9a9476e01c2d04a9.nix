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
      identifier = { name = "first-and-last"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (C) 2015 Mark Andrus Roberts";
      maintainer = "markandrusroberts@gmail.com";
      author = "Mark Andrus Roberts";
      homepage = "https://github.com/markandrus/first-and-last";
      url = "";
      synopsis = "First and Last generalized to return up to n values";
      description = "This library provides data types @<Data-Monoid-First.html#t:First-39- First' n>@ and @<Data-Monoid-Last.html#t:Last-39- Last' n>@ generalizing @First@ and @Last@ from @<https://hackage.haskell.org/package/base/docs/Data-Monoid.html Data.Monoid>@ to return up to @n@ values.\n\n>>> getFirst' (foldMap pure [1,2,3,4] :: First' 2 Int)\n[1,2]\n\n>>> getLast' (foldMap pure [1,2,3,4] :: Last' 2 Int)\n[3,4]\n\nIt also provides API-compatible type synonyms @<Data-Monoid-First.html#t:First First>@ and @<Data-Monoid-Last.html#t:Last Last>@ as well as functions @<Data-Monoid-First.html#v:getFirst getFirst>@ and @<Data-Monoid-Last.html#v:getLast getLast>@, allowing you to use it as a drop-in replacement.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      tests = {
        "Golden" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."Cabal" or (buildDepError "Cabal"))
            (hsPkgs."first-and-last" or (buildDepError "first-and-last"))
            ];
          buildable = true;
          };
        };
      };
    }