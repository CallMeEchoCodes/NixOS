{ lib, inputs, ... }:
let
  customLib = lib.fixedPoints.makeExtensible (final: {

  });
in
{
  flake.lib = customLib;
}
