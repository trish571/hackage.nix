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
      identifier = { name = "haskey-mtl"; version = "0.3.1.0"; };
      license = "BSD-3-Clause";
      copyright = "Copyright (c) 2017, Henri Verroken, Steven Keuchel";
      maintainer = "steven.keuchel@gmail.com";
      author = "Henri Verroken, Steven Keuchel";
      homepage = "https://github.com/haskell-haskey";
      url = "";
      synopsis = "A monad transformer supporting Haskey transactions.";
      description = "This library provides a monad transformer supporting Haskey transactions,\nwith default lifted instances for all mtl monad transformers.\n\nFor more information on how to use this package, visit\n<https://github.com/haskell-haskey/haskey-mtl>";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."exceptions" or (buildDepError "exceptions"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."haskey-btree" or (buildDepError "haskey-btree"))
          (hsPkgs."haskey" or (buildDepError "haskey"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."transformers-base" or (buildDepError "transformers-base"))
          ];
        buildable = true;
        };
      tests = {
        "haskey-mtl-example" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."haskey" or (buildDepError "haskey"))
            (hsPkgs."haskey-btree" or (buildDepError "haskey-btree"))
            (hsPkgs."haskey-mtl" or (buildDepError "haskey-mtl"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."exceptions" or (buildDepError "exceptions"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        };
      };
    }