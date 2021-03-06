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
      specVersion = "0";
      identifier = { name = "alsa-midi"; version = "0.3"; };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Henning Thielemann <haskell@henning-thielemann.de>";
      author = "Soenke Hahn";
      homepage = "http://open-projects.net/~shahn/index.php?seite=code";
      url = "";
      synopsis = "Bindings for the ALSA sequencer API (MIDI stuff)";
      description = "Bindings for the ALSA sequencer API (MIDI stuff)\nSince there is also\n<http://code.haskell.org/alsa/>\nwhich aims at a more complete interface to ALSA\nwe will no longer maintain this one.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."midi" or (buildDepError "midi"))
          (hsPkgs."event-list" or (buildDepError "event-list"))
          (hsPkgs."non-negative" or (buildDepError "non-negative"))
          ];
        libs = [ (pkgs."asound" or (sysDepError "asound")) ];
        buildable = true;
        };
      exes = {
        "playnote" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."midi" or (buildDepError "midi"))
            (hsPkgs."event-list" or (buildDepError "event-list"))
            (hsPkgs."non-negative" or (buildDepError "non-negative"))
            ];
          libs = [ (pkgs."asound" or (sysDepError "asound")) ];
          buildable = true;
          };
        "playmidi" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."midi" or (buildDepError "midi"))
            (hsPkgs."event-list" or (buildDepError "event-list"))
            (hsPkgs."non-negative" or (buildDepError "non-negative"))
            ];
          libs = [ (pkgs."asound" or (sysDepError "asound")) ];
          buildable = true;
          };
        "mididump" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."midi" or (buildDepError "midi"))
            (hsPkgs."event-list" or (buildDepError "event-list"))
            (hsPkgs."non-negative" or (buildDepError "non-negative"))
            ];
          libs = [ (pkgs."asound" or (sysDepError "asound")) ];
          buildable = true;
          };
        };
      };
    }