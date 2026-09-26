# areisto-abdyazji

## Coffee Menu UI — Week 2

This is my implementation for the Week 2 Coffee Menu UI screen as part of the Areisto Flutter Program.

---

## How to Run

1. Open your terminal, navigate to the project directory: `cd coffee_menu_ui`
2. Fetch dependencies and run: `flutter pub get` then `flutter run`

---

## The 5 Widgets

* **HeaderWidget:** Displays the greeting ("Good morning") along with the user's name and notification icon.
* **SearchBarWidget:** A custom-styled input field for searching menu items.
* **CategoryChipsWidget:** A horizontally scrollable list of category chips to filter the menu (e.g., Espresso, Cappuccino).
* **SectionTitleWidget:** A reusable row displaying section headers like "Popular" alongside a "See all" action button.
* **DrinkCardWidget:** A card widget representing an individual coffee item with its image icon, title, subtitle, price, and add button.

---

## Decisions

1. **Decomposing the Drink Card:** I decided to extract `DrinkCardWidget` into a separate file because leaving its complex layout (shadows, padding, icons, typography) inline would have made the main screen unreadable and impossible to reuse across different list sections.
2. **Centralized ThemeData:** Instead of hardcoding hex colors and Poppins text styles inside every text widget, I defined the primary colors and `TextTheme` inside `ThemeData` in `main.dart` to keep the code DRY and easy to maintain.
3. **Using ListView for Categories:** I opted for a horizontal `ListView.builder` (or `SingleChildScrollView` with a `Row`) for category chips to ensure smooth scrolling on smaller screens without overflowing the horizontal axis.

---

## Struggles

The hardest issue I faced was an **unbounded height / layout overflow error** when rendering the menu items list inside the main screen's `Column`. The screen threw an error because the `ListView` attempted to expand infinitely within a scrollable Column. I spent a considerable amount of time trying to fix it with fixed heights until I realized that wrapping the list in an `Expanded` widget (or setting `shrinkWrap: true` with `NeverScrollableScrollPhysics`) provided the proper height constraints that Flutter needed to calculate the layout correctly.