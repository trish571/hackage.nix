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
      identifier = { name = "opaleye-classy"; version = "0.3.1.0"; };
      license = "MIT";
      copyright = "";
      maintainer = "ben.kolera@gmail.com";
      author = "Ben Kolera";
      homepage = "https://github.com/benkolera/opaleye-classy/tree/master";
      url = "";
      synopsis = "Opaleye wrapped up in classy MTL attire.";
      description = "Classy MTL extension of the lovely Opaleye library, which simply just wraps things up in a MonadReader , MonadError context where the config & error are constrained by Classy Lenses & Prisms rather than by concrete types\n\nMore info on this pattern can be found in George Wilson's BFPG talk\n:\n<http://talks.bfpg.org/talks/2015-06-09.next_level_mtl.html>\n\nNote: This API may not be complete. If you need other functions exported then let me know or drop in a PR.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."lens" or (buildDepError "lens"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."postgresql-simple" or (buildDepError "postgresql-simple"))
          (hsPkgs."product-profunctors" or (buildDepError "product-profunctors"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."opaleye" or (buildDepError "opaleye"))
          ];
        buildable = true;
        };
      };
    }