## Week 3 Refactor

I cleaned up my Week 2 coffee menu code without changing the screen design.

I moved the widgets into separate files. I created a `Drink` class to hold each drink's name, subtitle, price, and icon. The grid now builds the cards from a list of drinks.

I moved the colors and text styles into `theme.dart`. I ran `flutter analyze` and got no issues. I also compared the Week 2 and Week 3 screens, and they looked the same.

I did not need an exception to the clean code rules.