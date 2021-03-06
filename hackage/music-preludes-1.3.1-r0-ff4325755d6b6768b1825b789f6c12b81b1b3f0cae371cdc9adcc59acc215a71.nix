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
      identifier = { name = "music-preludes"; version = "1.3.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Hans Hoglund";
      author = "Hans Hoglund";
      homepage = "";
      url = "";
      synopsis = "Some useful preludes for the Music Suite.";
      description = "Some useful preludes for the Music Suite.\nThis library is part of the Music Suite, see <http://musicsuite.github.com>.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."vector-space" or (buildDepError "vector-space"))
          (hsPkgs."musicxml2" or (buildDepError "musicxml2"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."monadplus" or (buildDepError "monadplus"))
          (hsPkgs."reverse-apply" or (buildDepError "reverse-apply"))
          (hsPkgs."music-score" or (buildDepError "music-score"))
          (hsPkgs."music-pitch" or (buildDepError "music-pitch"))
          (hsPkgs."music-pitch-literal" or (buildDepError "music-pitch-literal"))
          (hsPkgs."music-dynamics" or (buildDepError "music-dynamics"))
          (hsPkgs."music-dynamics-literal" or (buildDepError "music-dynamics-literal"))
          ];
        buildable = true;
        };
      exes = {
        "complex" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."lilypond" or (buildDepError "lilypond"))
            (hsPkgs."musicxml2" or (buildDepError "musicxml2"))
            (hsPkgs."music-pitch" or (buildDepError "music-pitch"))
            (hsPkgs."music-score" or (buildDepError "music-score"))
            (hsPkgs."music-preludes" or (buildDepError "music-preludes"))
            ];
          buildable = true;
          };
        "duo" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."lilypond" or (buildDepError "lilypond"))
            (hsPkgs."musicxml2" or (buildDepError "musicxml2"))
            (hsPkgs."music-pitch" or (buildDepError "music-pitch"))
            (hsPkgs."music-score" or (buildDepError "music-score"))
            (hsPkgs."music-preludes" or (buildDepError "music-preludes"))
            ];
          buildable = true;
          };
        "triplets" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."lilypond" or (buildDepError "lilypond"))
            (hsPkgs."musicxml2" or (buildDepError "musicxml2"))
            (hsPkgs."music-pitch" or (buildDepError "music-pitch"))
            (hsPkgs."music-score" or (buildDepError "music-score"))
            (hsPkgs."music-preludes" or (buildDepError "music-preludes"))
            ];
          buildable = true;
          };
        };
      };
    }