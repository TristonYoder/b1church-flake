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
  tag = "ubac69e55a7fe";

  upstream = {
    api = "0b99768a890ffd82f0e9c1499a8b4809c2692aaf";
    admin = "e7aa3f573730231a178698775b245f984dfdb743";
    portal = "b567558dd9999e8eea480c091ba30c0e8837470a";
  };
}
