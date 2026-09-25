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
  tag = "u5a5aeee11935";

  upstream = {
    api = "c1c706a9d51518a301cd5297a97e39d61a5b7f0d";
    admin = "939ea34af33a77f3a6e646f83b0b1272cdd4e714";
    portal = "a96a0e3fa2a11812c5ca28bd2501d170e8e84a09";
  };
}
