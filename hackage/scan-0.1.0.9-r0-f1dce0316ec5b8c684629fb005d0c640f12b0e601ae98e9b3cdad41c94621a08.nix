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
    flags = { parsec1 = false; };
    package = {
      specVersion = "1.4";
      identifier = { name = "scan"; version = "0.1.0.9"; };
      license = "BSD-3-Clause";
      copyright = "Christian Maeder 2010";
      maintainer = "chr.maeder@web.de";
      author = "chr.maeder@web.de";
      homepage = "http://projects.haskell.org/style-scanner";
      url = "";
      synopsis = "lexical style suggestions for source code";
      description = "scan checks the format of your haskell source code regarding:\ncomments, white spaces and line breaks.";
      buildType = "Simple";
      };
    components = {
      exes = {
        "scan" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            ] ++ (if flags.parsec1
            then [ (hsPkgs."parsec1" or (buildDepError "parsec1")) ]
            else [ (hsPkgs."parsec" or (buildDepError "parsec")) ]);
          buildable = true;
          };
        };
      };
    }