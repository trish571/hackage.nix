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
      identifier = { name = "feed-cli"; version = "2009.7.5"; };
      license = "BSD-3-Clause";
      copyright = "(c) Isaac Potoczny-Jones, 2008-2009";
      maintainer = "Isaac Potoczny-Jones <ijones@syntaxpolice.org>";
      author = "Isaac Potoczny-Jones <ijones@syntaxpolice.org>";
      homepage = "http://www.syntaxpolice.org/darcs_repos/feed-cli";
      url = "";
      synopsis = "A simple command line interface for creating and updating feeds like RSS";
      description = "This program generates RSS 2.0 (http://www.rssboard.org/rss-2-0-1-rv-6)\nfeeds based on command line arguments.  Use it to easily create and update\nfeeds from shell scripts, build scripts, cron jobs, CGIs, or other programs\ninstead of using an RSS or Atom library.\n\neg: ./feed-cli new-item -t\"entry of the day\" -d\"This is a description...\" -u/tmp/feed.xml  -lhttp://www.syntaxpolice.org";
      buildType = "Simple";
      };
    components = {
      exes = {
        "feed-cli" = {
          depends = [
            (hsPkgs."feed" or (buildDepError "feed"))
            (hsPkgs."xml" or (buildDepError "xml"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."directory" or (buildDepError "directory"))
            ];
          buildable = true;
          };
        };
      };
    }