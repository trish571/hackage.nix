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
      specVersion = "1.8";
      identifier = { name = "ViennaRNA-bindings"; version = "0.0.2.3"; };
      license = "LicenseRef-OtherLicense";
      copyright = "The ViennaRNA Team 1994-2013";
      maintainer = "choener@tbi.univie.ac.at";
      author = "Christian Hoener zu Siederdissen (bindings) 2013, The ViennaRNA Team (library) 1994-2013";
      homepage = "http://www.tbi.univie.ac.at/~choener/";
      url = "";
      synopsis = "ViennaRNA v2 bindings";
      description = "Bindings to the ViennaRNA package, version 2.x.y.\n\nOnly a partial set of bindings is provided. If you need additional functions,\nplease open an issue on github.\n\nThe ViennaRNA package needs to be installed. In addition, you should create a\nshared object from libRNA.a:\n\n@mkdir tmp; ar -x /usr/lib/libRNA.a; rm svm.o; gcc -shared *.o -o libRNA.so@\n\nThen, copy the resulting .so file into your library path or set\n@LD_LIBRARY_PATH@ appropriately. This is only necessary, if you want ghci\nsupport.\n\nIf you use this software, please cite:\nR. Lorenz, S.H. Bernhart, C. Hoener zu Siederdissen, H. Tafer, C. Flamm, P.F. Stadler and I.L. Hofacker (2011),\n\"ViennaRNA Package 2.0\", Algorithms for Molecular Biology: 6:26";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."array" or (buildDepError "array"))
          ];
        libs = [
          (pkgs."RNA" or (sysDepError "RNA"))
          (pkgs."gomp" or (sysDepError "gomp"))
          ];
        build-tools = [
          (hsPkgs.buildPackages.c2hs or (pkgs.buildPackages.c2hs or (buildToolDepError "c2hs")))
          ];
        buildable = true;
        };
      };
    }