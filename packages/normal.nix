{ pkgs }:
pkgs.iosevka.override {
  privateBuildPlan = builtins.readFile ./../plans/normal.toml;
  set = "IosevkaNormalCustom";
}
