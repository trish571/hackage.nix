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
      specVersion = "1.4";
      identifier = { name = "mongoDB"; version = "0.4.1"; };
      license = "MIT";
      copyright = "Copyright (c) 2010-2010 Scott Parish";
      maintainer = "Scott Parish <srp@srparish.net>";
      author = "Scott Parish <srp@srparish.net>";
      homepage = "http://github.com/srp/mongoDB";
      url = "";
      synopsis = "A driver for MongoDB";
      description = "This module lets you connect to MongoDB, do inserts,\nqueries, updates, etc. Also has many convience functions\ninspired by HDBC such as more easily converting between\nthe BsonValue types and native Haskell types.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."convertible" or (buildDepError "convertible"))
          (hsPkgs."data-binary-ieee754" or (buildDepError "data-binary-ieee754"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."nano-md5" or (buildDepError "nano-md5"))
          ];
        buildable = true;
        };
      };
    }