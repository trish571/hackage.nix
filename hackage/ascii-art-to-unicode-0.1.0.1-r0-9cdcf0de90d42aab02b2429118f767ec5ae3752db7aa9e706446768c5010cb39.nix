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
      identifier = { name = "ascii-art-to-unicode"; version = "0.1.0.1"; };
      license = "BSD-3-Clause";
      copyright = "2017 Franz Thoma";
      maintainer = "f.m.thoma@googlemail.com";
      author = "Franz Thoma";
      homepage = "https://github.com/fmthoma/ascii-art-to-unicode#readme";
      url = "";
      synopsis = "ASCII Art to Unicode Box Drawing converter";
      description = "@aa2u@ converts ASCII Art box drawings to Unicode.\n\n> > aa2u\n> +-------------+\n> | Hello World |\n> +-------------+\n> ^D\n> ┌─────────────┐\n> │ Hello World │\n> └─────────────┘\n\nFor more examples see the @doctest@ suite in \"Text.AsciiArt\".";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."comonad" or (buildDepError "comonad"))
          ];
        buildable = true;
        };
      exes = {
        "aa2u" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ascii-art-to-unicode" or (buildDepError "ascii-art-to-unicode"))
            (hsPkgs."strict" or (buildDepError "strict"))
            ];
          buildable = true;
          };
        };
      tests = {
        "ascii-art-to-unicode-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."ascii-art-to-unicode" or (buildDepError "ascii-art-to-unicode"))
            (hsPkgs."doctest" or (buildDepError "doctest"))
            ];
          buildable = true;
          };
        };
      };
    }