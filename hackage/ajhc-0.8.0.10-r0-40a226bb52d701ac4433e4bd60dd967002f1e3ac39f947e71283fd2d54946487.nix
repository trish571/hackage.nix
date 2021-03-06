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
      identifier = { name = "ajhc"; version = "0.8.0.10"; };
      license = "GPL-2.0-only";
      copyright = "";
      maintainer = "Metasepi team <metasepi@gmail.com>";
      author = "John Meacham <john@repetae.net>";
      homepage = "http://ajhc.metasepi.org/";
      url = "";
      synopsis = "Haskell compiler that produce binary through C language";
      description = "Ajhc is a fork of jhc.\nThe jhc is a haskell compiler which aims to produce the most efficient\nprograms possible via whole program analysis and other optimizations.\n\nThe jhc is very minimalist in that it does not have a precompiled run time\nsystem, but rather generates what is needed as part of the compilation\nprocess. However, back ends do have specific run-time representations of\ndata, which can be affected by things like the choice of garbage collector.\n\nPerhaps you can get internal overview with following compile flow image:\n\n\n<<https://raw.github.com/ajhc/ajhc/arafura/docs/jhc_compile_flow.png>>";
      buildType = "Custom";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."HsSyck" or (buildDepError "HsSyck"))
          (hsPkgs."array" or (buildDepError "array"))
          (hsPkgs."binary" or (buildDepError "binary"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."cpphs" or (buildDepError "cpphs"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."fgl" or (buildDepError "fgl"))
          (hsPkgs."filepath" or (buildDepError "filepath"))
          (hsPkgs."haskeline" or (buildDepError "haskeline"))
          (hsPkgs."mtl" or (buildDepError "mtl"))
          (hsPkgs."old-time" or (buildDepError "old-time"))
          (hsPkgs."pretty" or (buildDepError "pretty"))
          (hsPkgs."process" or (buildDepError "process"))
          (hsPkgs."random" or (buildDepError "random"))
          (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
          (hsPkgs."syb" or (buildDepError "syb"))
          (hsPkgs."temporary" or (buildDepError "temporary"))
          (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
          (hsPkgs."zlib" or (buildDepError "zlib"))
          ] ++ (if system.isWindows
          then [ (hsPkgs."Win32" or (buildDepError "Win32")) ]
          else [ (hsPkgs."unix" or (buildDepError "unix")) ]);
        buildable = true;
        };
      exes = {
        "ajhc" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HsSyck" or (buildDepError "HsSyck"))
            (hsPkgs."array" or (buildDepError "array"))
            (hsPkgs."binary" or (buildDepError "binary"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fgl" or (buildDepError "fgl"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."haskeline" or (buildDepError "haskeline"))
            (hsPkgs."mtl" or (buildDepError "mtl"))
            (hsPkgs."old-time" or (buildDepError "old-time"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."random" or (buildDepError "random"))
            (hsPkgs."regex-compat" or (buildDepError "regex-compat"))
            (hsPkgs."syb" or (buildDepError "syb"))
            (hsPkgs."temporary" or (buildDepError "temporary"))
            (hsPkgs."utf8-string" or (buildDepError "utf8-string"))
            (hsPkgs."zlib" or (buildDepError "zlib"))
            (hsPkgs."ajhc" or (buildDepError "ajhc"))
            ] ++ (if system.isWindows
            then [ (hsPkgs."Win32" or (buildDepError "Win32")) ]
            else [ (hsPkgs."unix" or (buildDepError "unix")) ]);
          buildable = true;
          };
        "jahm" = {
          depends = [
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."HTTP" or (buildDepError "HTTP"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."filepath" or (buildDepError "filepath"))
            (hsPkgs."network" or (buildDepError "network"))
            (hsPkgs."pretty" or (buildDepError "pretty"))
            (hsPkgs."process" or (buildDepError "process"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."ajhc" or (buildDepError "ajhc"))
            ] ++ (pkgs.lib).optional (!system.isWindows) (hsPkgs."unix" or (buildDepError "unix"));
          buildable = true;
          };
        };
      };
    }