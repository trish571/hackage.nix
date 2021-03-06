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
      identifier = { name = "GaussQuadIntegration"; version = "0.1"; };
      license = "BSD-3-Clause";
      copyright = "";
      maintainer = "Grigory Sarnitsky <sargrigory@ya.ru>";
      author = "Grigory Sarnitsky <sargrigory@ya.ru>";
      homepage = "";
      url = "";
      synopsis = "Non-adaptive Gaussian quadrature for numeric integraton";
      description = "This package provides means for numeric integration with a Gaussian quadrature. Precisely, it incorporates non-adaptive approximation for definite integrals using 128-, 256-, 512- and 1024-point Gaussian quadrature rule.\nFor example, to find the approximation of an integral with a 256-point rule:\n\n> ╭ a\n> │   f(x) dx = nIntegrate256 f a b\n> ╯ b\n\n> > nIntegrate256 (\\x -> x^999) 0 1\n> 9.999999999999887e-4\n\nThe type of a function here is not confined only by Double -> Double, indeed one can use any instance of Fractional:\n\n> > nIntegrate256 (\\x -> x^999 :: Fixed Prec50) 0 1\n> 0.00100000000000000000000000000000000000000000000009\n\n128 and 256 rules are given with the accuracy of 50 digits, 512 --- with 35 digits (roughly quad), all of them were computed by myself. 1024-point rule was taken from the Gauss-Legendre Quadrature C\\/C++ library by Pavel Holoborodko (<http://www.holoborodko.com/pavel/numerical-methods/numerical-integration/>) and goes with the accuracy of 25 decimal digits (fixed point).";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [ (hsPkgs."base" or (buildDepError "base")) ];
        buildable = true;
        };
      };
    }