{ pkgs }:
pkgs.iosevka.override {
  privateBuildPlan = builtins.readFile ./../plans/mono.toml;
  set = "MonoCustom";
}
