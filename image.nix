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
  tag = "ub79510c4e276";

  upstream = {
    api = "d27455c892e4cd550f8663ab39ea8ba097dfa992";
    admin = "ee7297fcbd6a01d9018f69293393b7315615992b";
    portal = "955f9a203ccc09a05eee0376a41e5027b844acfc";
  };
}
