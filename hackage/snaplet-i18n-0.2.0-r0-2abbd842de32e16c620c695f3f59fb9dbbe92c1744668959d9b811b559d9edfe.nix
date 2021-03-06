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
      identifier = { name = "snaplet-i18n"; version = "0.2.0"; };
      license = "BSD-3-Clause";
      copyright = "Haisheng Wu";
      maintainer = "freizl@gmail.com";
      author = "Haisheng,Wu";
      homepage = "https://github.com/HaskellCNOrg/snaplet-i18n";
      url = "";
      synopsis = "snaplet-i18n";
      description = "A light weight i18n snaplet.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."configurator" or (buildDepError "configurator"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."heist" or (buildDepError "heist"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."snap" or (buildDepError "snap"))
          (hsPkgs."snap-loader-static" or (buildDepError "snap-loader-static"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."xmlhtml" or (buildDepError "xmlhtml"))
          (hsPkgs."map-syntax" or (buildDepError "map-syntax"))
          ];
        buildable = true;
        };
      exes = {
        "demo" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."configurator" or (buildDepError "configurator"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."heist" or (buildDepError "heist"))
            (hsPkgs."lens" or (buildDepError "lens"))
            (hsPkgs."snap" or (buildDepError "snap"))
            (hsPkgs."snap-loader-static" or (buildDepError "snap-loader-static"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."xmlhtml" or (buildDepError "xmlhtml"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."snaplet-i18n" or (buildDepError "snaplet-i18n"))
            (hsPkgs."map-syntax" or (buildDepError "map-syntax"))
            ];
          buildable = true;
          };
        };
      };
    }