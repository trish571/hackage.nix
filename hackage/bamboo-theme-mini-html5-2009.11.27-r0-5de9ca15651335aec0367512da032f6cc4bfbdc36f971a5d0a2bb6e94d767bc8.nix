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
      specVersion = "1.2";
      identifier = {
        name = "bamboo-theme-mini-html5";
        version = "2009.11.27";
        };
      license = "LicenseRef-GPL";
      copyright = "";
      maintainer = "Wang, Jinjing <nfjinjing@gmail.com>";
      author = "Wang, Jinjing";
      homepage = "http://github.com/nfjinjing/bamboo-theme-mini-html5";
      url = "";
      synopsis = "bamboo mini html5 theme";
      description = "bamboo mini html5 theme";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."cgi" or (buildDepError "cgi"))
          (hsPkgs."network" or (buildDepError "network"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."haskell98" or (buildDepError "haskell98"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."unix" or (buildDepError "unix"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."base64-string" or (buildDepError "base64-string"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."parsedate" or (buildDepError "parsedate"))
          (hsPkgs."rss" or (buildDepError "rss"))
          (hsPkgs."xhtml" or (buildDepError "xhtml"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."gravatar" or (buildDepError "gravatar"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."mps" or (buildDepError "mps"))
          (hsPkgs."hcheat" or (buildDepError "hcheat"))
          (hsPkgs."hack" or (buildDepError "hack"))
          (hsPkgs."hack-contrib" or (buildDepError "hack-contrib"))
          (hsPkgs."bamboo" or (buildDepError "bamboo"))
          (hsPkgs."moe" or (buildDepError "moe"))
          (hsPkgs."yuuko" or (buildDepError "yuuko"))
          ];
        buildable = true;
        };
      };
    }