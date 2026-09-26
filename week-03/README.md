## Week 3 Refactor

I cleaned up my Week 2 coffee menu code without changing the screen design.

I moved the widgets into separate files. I created a `Drink` class to hold each drink's name, subtitle, price, and icon. The grid now builds the cards from a list of drinks.

I moved the colors and text styles into `theme.dart`. I ran `flutter analyze` and got no issues. I also compared the Week 2 and Week 3 screens, and they looked the same.

I did not need an exception to the clean code rules.

## Git diff before push

I ran `git diff --stat main` before pushing.

```dart
 README.md                                          |   1 -
 week-02/coffee_menu_ui/.gitignore                  |  45 ++
 week-02/coffee_menu_ui/.metadata                   |  45 ++
 week-02/coffee_menu_ui/README.md                   |  16 +
 week-02/coffee_menu_ui/analysis_options.yaml       |  28 +
 week-02/coffee_menu_ui/android/.gitignore          |  14 +
 .../coffee_menu_ui/android/app/build.gradle.kts    |  44 ++
 .../android/app/src/debug/AndroidManifest.xml      |   7 +
 .../android/app/src/main/AndroidManifest.xml       |  45 ++
 .../com/example/coffee_menu_ui/MainActivity.kt     |   5 +
 .../main/res/drawable-v21/launch_background.xml    |  12 +
 .../src/main/res/drawable/launch_background.xml    |  12 +
:
```