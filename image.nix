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
  tag = "u8cd8b20665ac";

  upstream = {
    api = "6e50224f31c214f717ba498240a2208a7aafd4d3";
    admin = "883ffd28744d052badaf3d225fbab01fce2964d8";
    portal = "c34ddb6b1df774782b76b60a57162090573c6797";
  };
}
