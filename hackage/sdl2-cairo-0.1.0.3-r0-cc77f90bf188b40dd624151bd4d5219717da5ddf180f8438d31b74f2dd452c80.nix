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
    flags = { builddemo = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "sdl2-cairo"; version = "0.1.0.3"; };
      license = "MIT";
      copyright = "Copyright (c) 2015 Anton Pirogov";
      maintainer = "anton.pirogov@gmail.com";
      author = "Anton Pirogov";
      homepage = "";
      url = "";
      synopsis = "Render with Cairo on SDL textures. Includes optional convenience drawing API.";
      description = "This small library provides convenience functions to draw\non SDL2 textures with Cairo. As Cairo is complicated, it also\nprovides a drawing API, which is heavily inspired by Processing and\nis much more user-friendly. If it does not support something,\nyou can always embed direct Cairo commands, so you do not have\nto decide!";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."sdl2" or (buildDepError "sdl2"))
          (hsPkgs."cairo" or (buildDepError "cairo"))
          (hsPkgs."linear" or (buildDepError "linear"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."time" or (buildDepError "time"))
          ];
        buildable = true;
        };
      exes = {
        "sdl2-cairo-test" = {
          depends = (pkgs.lib).optionals (flags.builddemo) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."sdl2" or (buildDepError "sdl2"))
            (hsPkgs."cairo" or (buildDepError "cairo"))
            (hsPkgs."sdl2-cairo" or (buildDepError "sdl2-cairo"))
            (hsPkgs."linear" or (buildDepError "linear"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."time" or (buildDepError "time"))
            ];
          buildable = if flags.builddemo then true else false;
          };
        };
      };
    }