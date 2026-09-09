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
  tag = "uea12de01c2f1";

  upstream = {
    api = "11d280a5cf3551bbdc54b8e5da161dbad4c1918e";
    admin = "f00a7a2811da7ef931a2c5f98df9ed02c89e7e2a";
    portal = "5543931461810019d5af884a4090b2b055f0d8a2";
  };
}
