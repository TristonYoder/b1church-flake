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
  tag = "u25b96d1e6f07";

  upstream = {
    api = "828d6d79c1f644faec7e1d4fbfe6383307592cda";
    admin = "3bdbe96989ac56fb013d93c64c403aeda074dff7";
    portal = "5a22bd826bfe38f024919534d1f1a38877983bce";
  };
}
