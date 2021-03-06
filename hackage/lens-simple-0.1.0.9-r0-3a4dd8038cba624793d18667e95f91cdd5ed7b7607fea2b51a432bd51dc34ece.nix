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
      identifier = { name = "lens-simple"; version = "0.1.0.9"; };
      license = "BSD-3-Clause";
      copyright = "2012, 2013, 2014 Russell O'Connor; 2015 Michael Thompson";
      maintainer = "what_is_it_to_do_anything@yahoo.com";
      author = "michaelt";
      homepage = "https://github.com/michaelt/lens-simple";
      url = "";
      synopsis = "simplified import of elementary lens-family combinators";
      description = "This module, <http://hackage.haskell.org/package/lens-simple/docs/Lens-Simple.html Lens.Simple>,\njust re-exports the main modules from Russell O\\'Connor's\n<http://hackage.haskell.org/package/lens-family lens-family> package, the\noriginal van Laarhoven-O'Connor lens library.\n@lens-family@ is particularly remarkable for its minute number of dependencies:\n(apart from <http://hackage.haskell.org/package/mtl mtl>\nthey are all ghc \\'boot\\' libraries); but more importantly for its\nextreme conceptual simplicity and theoretical soundness. Much of\nthe material it contains is well-explained, from a tutorial point of view, by\n<http://hackage.haskell.org/package/lens-tutorial lens-tutorial> It is independent,\nself-standing and readily intelligible apart from any darker\nmore general system of combinators that might attempt to extend it. Much\nof it ought to be in the Prelude.\n\nConvenient import of the elementary combinators from @lens-family@,\nhowever, a little complicated. The idea of this trivial module, then, is just to make a sort of\nlow-powered, minimal-dependency, @lens-family@ equivalent of\nthe 800 lb gorilla of lens library imports:\n\n> import Control.Lens\n\nnamely, the light-weight and elegant:\n\n> import Lens.Simple\n\nCheck it out, it's even one character shorter!\n\nThe material in <http://hackage.haskell.org/package/lens-tutorial lens-tutorial>\nwill work fine if you make this substitution in the underlying\n<http://hackage.haskell.org/package/lens-tutorial-1.0.0/docs/src/Control-Lens-Tutorial.html source>\nand follow along as prompted.\n\nAs another illustration of the simplicity of the\nfundamental van Laarhoven-O'Connor lens combinators - and their homogeneity with\n@Control.Lens@ - note that the gloss\n<https://github.com/michaelt/lens-family-simple/blob/master/examples/Pong.hs pong example>\nfrom the @lens@ library examples directory - which continues to be\namong the best introductory lens tutorials precisely by saying nothing -\nrequires only this abbreviating change of imports.\n\nIf you make that program more complicated,\nyou might of course end up needing\nthe more sophisticated material in @Control.Lens@ and\nits immense mass of dependencies. On the other hand,\nyou might just need some of the additional material\npresent in the similarly demystifying\n<http://hackage.haskell.org/package/microlens microlens>\nor <http://hackage.haskell.org/package/microlens-th microlens-th> and\nthe associated modules.\n\nThis module was originally intended to simplify the use of packages that\nfollow the original promise of the van Laarhoven-O'Connor lenses.\n/Correct practice is to export lenses without depending on a lens-library, where possible./\nIn basic cases these just use familiar @Prelude@ types, after all.\nExamples of best practices in this respect are e.g. <http://hackage.haskell.org/package/lens-family-th lens-family-th> which\ndoesn't depend on @lens-family@ despite its name and pipes-related packages like\n<http://hackage.haskell.org/package/pipes-bytestring pipes-bytestring>\nand <http://hackage.haskell.org/package/pipes-group pipes-group>.\n\n@Lens.Simple@ also re-exports convenient TH incantations like\n@makeLenses@ from Dan Burton's associated\n<http://hackage.haskell.org/package/lens-family-th lens-family-th>.\n";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."lens-family" or (buildDepError "lens-family"))
          (hsPkgs."lens-family-core" or (buildDepError "lens-family-core"))
          (hsPkgs."lens-family-th" or (buildDepError "lens-family-th"))
          ];
        buildable = true;
        };
      };
    }