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
  tag = "u6d539fa901fc";

  upstream = {
    api = "a7d9b65c5e86b8ec4989b5cbfb8bc4cd0a8c867c";
    admin = "8e1efa790f3340cf307318be2ec66a2085e26035";
    portal = "b6755ce46a239332abbc09c18be6d64e8ea3652f";
  };
}
