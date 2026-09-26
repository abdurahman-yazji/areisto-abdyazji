# Part C — Explain your tree

### 1. Where did you split your widgets, and why there? Pick one widget you extracted and explain what would break, or become annoying, if you had left it inline in the main build method.
I split the UI into smaller, standalone widgets—like `GreetingRow`, `CustomerSearchBar`, `CategoryChips`, `OfferBanner`, `DrinkGrid`, `DrinkCard`, and `BottomNavBar`—to stop `MenuScreen` from becoming a massive wall of messy code. 

Extracting `DrinkCard` was the most important split. If I had left `DrinkCard` written directly inside `DrinkGrid`'s `itemBuilder`, `main.dart` would have been a total nightmare to read and full of repeated styling and nested containers. Doing this also makes `DrinkCard` reusable if I want to show drinks on another screen (like a Favorites page). Plus, it helps Flutter avoid rebuilding the whole screen whenever something small changes, which keeps performance smooth.

---

### 2. Expanded, Flexible, and SizedBox — what does each one do? Give an example of each from your own submission, or explain where you would have used it if you did not.

* **`Expanded`**: Forces a child in a `Column` or `Row` to take up all the leftover space it can get.
  * *My code*: I used it around `SingleChildScrollView` in `MenuScreen` so the scrollable content fills all the space between the top and the `BottomNavBar`.
* **`Flexible`**: Gives a child room to grow up to a limit, but doesn't force it to take up every bit of extra space like `Expanded` does.
  * *Where to use it*: I could use it for the drink title in `DrinkCard` so long product names shrink or adapt without causing layout overflows.
* **`SizedBox`**: Gives a widget a fixed height or width, mostly used as a quick way to add spacing between elements.
  * *My code*: I used it everywhere in `MenuScreen` (like `SizedBox(height: 24)`) to leave clean gaps between sections.

---

### 3. Describe one layout problem that cost you more than thirty minutes this week,What was the error, what did you try, and what turned out to be the cause?


My biggest headache this week happened when I tried putting `GridView.builder` inside `SingleChildScrollView` on the main menu.

* **The Error**: The app crashed with the classic red screen error: `Unbounded height / Vertical viewport was given unbounded height`.
* **What I tried**: At first, I tried wrapping the `GridView` in a `Container` with fixed dimensions, and even tried wrapping it in an `Expanded` widget. That just made things worse because scroll views don't give fixed height constraints to their children.
* **The Cause & Solution**: The issue was that `GridView` wants to stretch infinitely, while `SingleChildScrollView` gives it infinite vertical room, so Flutter got confused. I fixed it by adding `shrinkWrap: true` to `DrinkGrid` so it only takes the space it actually needs, and `physics: const NeverScrollableScrollPhysics()` so the main `SingleChildScrollView` handles all the scrolling.