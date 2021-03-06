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
    flags = { debug = false; test = false; incabal = true; buildlib = true; };
    package = {
      specVersion = "1.8";
      identifier = { name = "penny-lib"; version = "0.14.0.0"; };
      license = "BSD-3-Clause";
      copyright = "2012-2013 Omari Norman.";
      maintainer = "omari@smileystation.com";
      author = "Omari Norman";
      homepage = "http://www.github.com/massysett/penny";
      url = "";
      synopsis = "Extensible double-entry accounting system - library";
      description = "Penny is a double-entry accounting system. It is inspired\nby, but incompatible with, John Wiegley's Ledger, which is available\nat <http://ledger-cli.org/>.\n\nThis package is a library. To start using Penny you will want to\ninstall the penny-bin package, which has the executable programs.\nMore about the penny-bin package, along with a full sales pitch\nfor Penny and how to get started, is at\n<http://hackage.haskell.org/package/penny-bin>. It may be installed\nwith \"cabal install penny-bin\".\n\nThe Penny library is a full system to work with double-entry\naccounting transactions and postings and to make reports with them.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."action-permutations" or (buildDepError "action-permutations"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."cereal" or (buildDepError "cereal"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."explicit-exception" or (buildDepError "explicit-exception"))
          (hsPkgs."matchers" or (buildDepError "matchers"))
          (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
          (hsPkgs."multiarg" or (buildDepError "multiarg"))
          (hsPkgs."ofx" or (buildDepError "ofx"))
          (hsPkgs."old-locale" or (buildDepError "old-locale"))
          (hsPkgs."parsec" or (buildDepError "parsec"))
          (hsPkgs."pcre-light" or (buildDepError "pcre-light"))
          (hsPkgs."prednote" or (buildDepError "prednote"))
          (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
          (hsPkgs."rainbow" or (buildDepError "rainbow"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."split" or (buildDepError "split"))
          (hsPkgs."strict" or (buildDepError "strict"))
          (hsPkgs."terminfo" or (buildDepError "terminfo"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          ];
        buildable = if !flags.buildlib then false else true;
        };
      exes = {
        "penny-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."action-permutations" or (buildDepError "action-permutations"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."explicit-exception" or (buildDepError "explicit-exception"))
            (hsPkgs."matchers" or (buildDepError "matchers"))
            (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
            (hsPkgs."multiarg" or (buildDepError "multiarg"))
            (hsPkgs."ofx" or (buildDepError "ofx"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."pcre-light" or (buildDepError "pcre-light"))
            (hsPkgs."prednote" or (buildDepError "prednote"))
            (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
            (hsPkgs."rainbow" or (buildDepError "rainbow"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."strict" or (buildDepError "strict"))
            (hsPkgs."terminfo" or (buildDepError "terminfo"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
            ];
          buildable = if !flags.test then false else true;
          };
        "penny-gibberish" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."action-permutations" or (buildDepError "action-permutations"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."cereal" or (buildDepError "cereal"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."explicit-exception" or (buildDepError "explicit-exception"))
            (hsPkgs."matchers" or (buildDepError "matchers"))
            (hsPkgs."monad-loops" or (buildDepError "monad-loops"))
            (hsPkgs."multiarg" or (buildDepError "multiarg"))
            (hsPkgs."ofx" or (buildDepError "ofx"))
            (hsPkgs."old-locale" or (buildDepError "old-locale"))
            (hsPkgs."parsec" or (buildDepError "parsec"))
            (hsPkgs."pcre-light" or (buildDepError "pcre-light"))
            (hsPkgs."prednote" or (buildDepError "prednote"))
            (hsPkgs."pretty-show" or (buildDepError "pretty-show"))
            (hsPkgs."rainbow" or (buildDepError "rainbow"))
            (hsPkgs."semigroups" or (buildDepError "semigroups"))
            (hsPkgs."split" or (buildDepError "split"))
            (hsPkgs."strict" or (buildDepError "strict"))
            (hsPkgs."terminfo" or (buildDepError "terminfo"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."transformers" or (buildDepError "transformers"))
            (hsPkgs."QuickCheck" or (buildDepError "QuickCheck"))
            (hsPkgs."random-shuffle" or (buildDepError "random-shuffle"))
            (hsPkgs."random" or (buildDepError "random"))
            ];
          buildable = if !flags.test then false else true;
          };
        };
      };
    }