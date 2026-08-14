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
  tag = "uf040deacec5f";

  upstream = {
    api = "aa900e6543ce3d0c6fdbd00328066df155343b25";
    admin = "f1cc227260cfeee78e03649b2ba56e18bf42466f";
    portal = "0cb58ca7331605e28d9d99a0a0447e7bdeef2ffe";
  };
}
