{ pkgs }:
pkgs.iosevka.override {
  privateBuildPlan = builtins.readFile ./../plans/term.toml;
  set = "TermCustom";
}
