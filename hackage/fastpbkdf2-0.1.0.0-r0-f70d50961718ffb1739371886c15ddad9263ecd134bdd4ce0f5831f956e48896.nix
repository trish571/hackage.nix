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
      identifier = { name = "fastpbkdf2"; version = "0.1.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2016 Alfredo Di Napoli";
      maintainer = "alfredo.dinapoli@gmail.com";
      author = "Alfredo Di Napoli";
      homepage = "https://github.com/adinapoli/fastpbkdf2-hs#readme";
      url = "";
      synopsis = "Haskell bindings to the fastpbkdf2 C library";
      description = "Please see README.md";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          ];
        libs = if system.isWindows || system.isWindows
          then [
            (pkgs."eay32" or (sysDepError "eay32"))
            (pkgs."ssl32" or (sysDepError "ssl32"))
            ]
          else [ (pkgs."crypto" or (sysDepError "crypto")) ];
        buildable = true;
        };
      tests = {
        "fastpbkdf2-hs-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."base16-bytestring" or (buildDepError "base16-bytestring"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."fastpbkdf2" or (buildDepError "fastpbkdf2"))
            (hsPkgs."tasty" or (buildDepError "tasty"))
            (hsPkgs."tasty-hunit" or (buildDepError "tasty-hunit"))
            ];
          buildable = true;
          };
        };
      benchmarks = {
        "fastpbkdf2-bench" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."criterion" or (buildDepError "criterion"))
            (hsPkgs."fastpbkdf2" or (buildDepError "fastpbkdf2"))
            (hsPkgs."cryptonite" or (buildDepError "cryptonite"))
            (hsPkgs."pbkdf" or (buildDepError "pbkdf"))
            ];
          buildable = true;
          };
        };
      };
    }