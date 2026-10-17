# Part A — Three Questions

---

## 1. What is a Future?

A Future is a promise that a value will arrive later. It is like ordering food at a restaurant: you get a receipt right now, and the food comes after some time. Dart does not stop and wait for it, so the app keeps running and the screen does not freeze. The word `await` pauses only the function it is written inside, until the Future is finished, and then that function continues with the result. All the other code in the app keeps running while that one function waits.

---

## 2. How does the order reach the cart and detail screens?

The menu screen creates one `Order` object and keeps it in its State. When I open another screen, I pass that same object through the constructor, for example `CartScreen(order: _order)`. For the detail screen, I pass a function (`onAdd`) that adds the new drink to the order and calls `setState` in the menu screen. Because all screens use the same object, they all see the same data and there are no copies. I keep the order in the menu screen because it stays open under the other screens, so it lives longer than both of them.

---

## 3. What if the user taps "Place order" twice?

 The second tap starts a second request, so the order is sent twice and the customer may pay twice. To prevent this, I will use a variable `_isPlacingOrder`. When the first tap happens, I set it to `true` with `setState`, so the button becomes disabled (`onPressed: null`) and shows a spinner. I will also check this variable at the start of `_placeOrder` and `return` if it is already `true`, as a second safety. When the request ends, with success or with an error, I set it back to `false`, and I check `mounted` before calling `setState` after the `await`.