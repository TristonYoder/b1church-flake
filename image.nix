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
  tag = "ufe540a6d8fb6";

  upstream = {
    api = "e6b36e8bc0ab821f13ec0725a9152c7d9f5cdea5";
    admin = "a322d6cba3040f4e041eb01872bc0a5bdbb40cf7";
    portal = "00eb544e6a2b019b0a69758aad8ca7bd3b9b14cc";
  };
}
