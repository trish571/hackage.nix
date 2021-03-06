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
    flags = { readline = true; };
    package = {
      specVersion = "1.2";
      identifier = { name = "Yogurt"; version = "0.4"; };
      license = "BSD-3-Clause";
      copyright = "Some Rights Reserved (CC) 2008-2009 Martijn van Steenbergen";
      maintainer = "martijn@van.steenbergen.nl";
      author = "Martijn van Steenbergen";
      homepage = "http://code.google.com/p/yogurt-mud/";
      url = "";
      synopsis = "A MUD client library";
      description = "Yogurt is a functional MUD client featuring prioritized, regex-based hooks, variables, timers, logging, dynamic loading of Yogurt scripts and more. For example programs, please see Yogurt's home page.\n\nThis package provides the library. To use Yogurt as a standalone executable and dynamically load and reload Yogurt scripts, please see package @Yogurt-Standalone@.\n\nIf you do not wish to install the readline-based command-line interface available in module @Network.Yogurt.Readline@, install using @cabal install Yogurt -f-readline@.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."regex-posix" or (buildDepError "regex-posix"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          ] ++ (if compiler.isGhc && (compiler.version).ge "6.10"
          then [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."syb" or (buildDepError "syb"))
            ]
          else [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base" or (buildDepError "base"))
            ])) ++ (pkgs.lib).optionals (flags.readline) [
          (hsPkgs."readline" or (buildDepError "readline"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."network" or (buildDepError "network"))
          ];
        buildable = true;
        };
      };
    }