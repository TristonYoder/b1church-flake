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
  tag = "u074ed26725dd";

  upstream = {
    api = "8bf2e1d13bea114b43fd56758ea8a4f2d9bc3579";
    admin = "6b2728037b2b6be91e92d26d4fae34d4a084fd68";
    portal = "fd1ca1e00044763ac107bb526a6a5f9f6ca89c79";
  };
}
