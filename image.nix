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
  tag = "u0ab92a385b51";

  upstream = {
    api = "2e4657145a182f5381196c36560a6133a3679159";
    admin = "f57ab6023a8d592376920209253338506dd10d68";
    portal = "85582092b52377ad8e5c8ea09bc60ce9c34bc8b4";
  };
}
