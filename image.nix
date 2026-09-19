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
  tag = "ucb4905012723";

  upstream = {
    api = "cb8f52f856c45b346d7ec717e4ffd05b15c60311";
    admin = "78dc57ab68d54d1abd0f05cb0d2c5944b165f65f";
    portal = "91d207f17f979da202913a651b11e39495615743";
  };
}
