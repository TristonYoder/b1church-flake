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
  tag = "u06c3927e7b0a";

  upstream = {
    api = "fed5915d2e727daa9dc3491f4e234433c0b9eb89";
    admin = "2f54f2a4e8b7dcab85ee98677c05c7b06318bcb1";
    portal = "960d299aa7f73c6e345077fbe1607258d01592e0";
  };
}
