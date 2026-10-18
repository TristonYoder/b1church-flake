# Written by .github/workflows/build.yml — do not edit by hand.
#
# The nightly build publishes tagged images and commits the tag here,
# so this repo's git revision *is* the deployed version: consumers pin
# it through flake.lock and upgrade with `nix flake update b1church`.
#
# The tag is derived from the three upstream commits below, so it only
# changes when upstream does.
{
  registry = "ghcr.io/tristonyoder/b1church";
  tag = "u195ac8f71e92";

  upstream = {
    api = "a34003fd8ff6ab8a1a6757c172e59274047edc6e";
    admin = "888a3fd4ee32e742d4d1ebaf170dc0e9bf69e8eb";
    portal = "01e8fb456487a4d17149d21662c1dae0ae7f4dba";
  };
}
