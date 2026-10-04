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
  tag = "uadbed6c2c36f";

  upstream = {
    api = "e05a0578f86a8d27881dfb550071f5c9c20577e8";
    admin = "f4ad7aa7c55ca8822eaca129ec8ddac31dacf93b";
    portal = "1576b1341a93922aaafb2d4f497acba9d267a53d";
  };
}
