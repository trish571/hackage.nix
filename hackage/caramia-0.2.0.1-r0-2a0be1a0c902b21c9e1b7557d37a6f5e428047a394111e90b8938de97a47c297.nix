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
      identifier = { name = "caramia"; version = "0.2.0.1"; };
      license = "MIT";
      copyright = "Copyright (c) 2014 Mikko Juola";
      maintainer = "mikjuo@gmail.com";
      author = "Mikko Juola";
      homepage = "https://github.com/Noeda/caramia/";
      url = "";
      synopsis = "Less painful OpenGL 3.3 rendering";
      description = "This is an experimental OpenGL bindings library for real-time graphics for\nHaskell, using OpenGL 3.3.\n\nRequirements:\n\n* GHC 7.6+\n\n* OpenGL 3.3 (and GL\\_ARB\\_texture\\_storage) (on the system where programs are run)\n\nYou need to use `-threaded` flag in executables that use this library.\n\nHere are the most important features of this library:\n\n* Safe and automatic finalization of OpenGL resources\n\n* No implicit state (that is, no glBind* mess or equivalent). There is a\nmonad for mass-rendering that has implicit state but the state is localized\nto running of that monad. (see Caramia.Render).\n\n* The only required extension beyond vanilla OpenGL 3.3 is\nGL\\_ARB\\_texture\\_storage. Some other extensions are used if they are\navailable.\n\nHere are some curious features that you might find useful.\n\n* This library plays nice with other OpenGL libraries. It does not mess up\nthe implicit OpenGL state (except for aforementioned rendering monad).\n\n* This library does not create an OpenGL context. You can use whatever\nlibrary you want to create an OpenGL context as long as it can get an\nOpenGL 3.3 context. You may be interested at looking at the tests in\nthis package to see how to use this with the `sdl2` package.\n\n* Operations are in the `IO` monad. No messing around with custom monads.\n\n(At least) the following OpenGL concepts are present in this library:\n\n* Buffer objects (you can do low-level mapping and use raw pointers)\n\n* Geometry, vertex and fragment shaders\n\n* Indexed and non-indexed rendering\n\n* Framebuffers\n\n* Textures (with many topologies, 1D, 2D, 3D, texture arrays, cube textures;\nwe also have buffer textures and multisampling textures)\n\n* Vertex array objects\n\n* Blending, stencil, depth and cull tests\n\n* Instanced rendering\n\n* Synchronization objects\n\nSome notable missing features:\n\n* Tesselation shaders. This is an OpenGL 4.x feature but we could add it.\n\n* Using shaders with transform feedback.\n\n* Multi-threaded rendering.\n\nThis library tries to avoid including obsolete or redundant features of OpenGL.\n\nOne major flaw(?) of this library is that OpenGL resources cannot be easily\nreleased promptly. This may or may not be a problem for you. OpenGL resources\nmay refer to each other behind the scenes so if we implement a mechanism to\nrelease resources early, this mechanism needs to take care of resources\nreferring to each other.\n\nExpect bugs. While this library has been tested in some of the author's toy\nprograms, the library currently lacks automatic tests.";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."transformers" or (buildDepError "transformers"))
          (hsPkgs."semigroups" or (buildDepError "semigroups"))
          (hsPkgs."OpenGLRaw" or (buildDepError "OpenGLRaw"))
          ];
        frameworks = (pkgs.lib).optional (system.isOsx) (pkgs."OpenGL" or (sysDepError "OpenGL"));
        buildable = true;
        };
      tests = {
        "smoke-test" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."caramia" or (buildDepError "caramia"))
            (hsPkgs."sdl2" or (buildDepError "sdl2"))
            (hsPkgs."text" or (buildDepError "text"))
            ];
          buildable = true;
          };
        "memory-info" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."caramia" or (buildDepError "caramia"))
            (hsPkgs."sdl2" or (buildDepError "sdl2"))
            ];
          buildable = true;
          };
        };
      };
    }