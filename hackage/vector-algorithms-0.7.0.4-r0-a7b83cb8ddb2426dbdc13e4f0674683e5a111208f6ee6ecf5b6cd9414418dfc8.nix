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
    flags = {
      boundschecks = true;
      unsafechecks = false;
      internalchecks = false;
      bench = false;
      properties = true;
      llvm = false;
      };
    package = {
      specVersion = "1.9.2";
      identifier = { name = "vector-algorithms"; version = "0.7.0.4"; };
      license = "BSD-3-Clause";
      copyright = "(c) 2008,2009,2010,2011,2012,2013,2014,2015 Dan Doel\n(c) 2015 Tim Baumann";
      maintainer = "Dan Doel <dan.doel@gmail.com>\nErik de Castro Lopo <erikd@mega-nerd.com>";
      author = "Dan Doel";
      homepage = "https://github.com/erikd/vector-algorithms/";
      url = "";
      synopsis = "Efficient algorithms for vector arrays";
      description = "Efficient algorithms for sorting vector arrays. At some stage\nother vector algorithms may be added.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."primitive" or (buildDepError "primitive"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ] ++ (pkgs.lib).optional (!(compiler.isGhc && (compiler.version).ge "7.8")) (hsPkgs."tagged" or (buildDepError "tagged"));
        buildable = true;
        };
      exes = {
        "simple-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."mwc-random" or (buildDepError "mwc-random"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."vector-algorithms" or (buildDepError "vector-algorithms"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            ];
          buildable = if !flags.bench then false else true;
          };
        };
      tests = {
        "properties" = {
          depends = (pkgs.lib).optionals (!(!flags.properties)) [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."vector-algorithms" or (buildDepError "vector-algorithms"))
            ];
          buildable = if !flags.properties then false else true;
          };
        };
      };
    }