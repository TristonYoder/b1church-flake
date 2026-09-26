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
  tag = "ucd3e67f93e1f";

  upstream = {
    api = "599f77cb7250b48b0f621cbf3e58fd2449807a28";
    admin = "266450051366949265469819618ae2252203efae";
    portal = "33d9408689f2f56a3a769c37ee4e1cdda419a3f1";
  };
}
