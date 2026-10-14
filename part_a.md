# Part A — Conceptual Questions

### 1. What is a Future? Explain it to someone who has never written async code. Then: what does await actually do to the function it is written inside?
A `Future` is like a receipt or a promise for a value that is not available yet, but will be at some point in the time. Imagine ordering a coffee at a counter: the barista hands you a receipt with an order number (the `Future`). You don't have the actual coffee yet, but the receipt guarantees that you will either receive your coffee once it's brewed (a resolved Future) or be informed that the coffee machine broke (an error/exception).

When you write `await` inside an `async` function, it pauses the execution of that specific function at that exact line until the `Future` completes. While that function is paused, it does not freeze or block the rest of the application or the user interface. Flutter continues rendering animations and responding to user taps elsewhere. Once the awaited `Future` finishes and returns its result (or throws an error), the function resumes right after the `await` line with the resolved data.

---

### 2. Your menu screen owns the order. The cart screen needs to show it, and the detail screen needs to add to it. Neither of those screens is inside the menu screen's widget tree in the way DrinkCard was. So how does the order reach them? Describe your approach before you build it.
Since state management packages like Provider or Bloc are not used in this project, data is passed explicitly using Flutter's `Navigator` mechanism.

When navigating from the Menu Screen to the Drink Detail Screen, we pass the selected `Drink` instance via constructor arguments to configure options (size, extra shots). When the user completes their selection and taps "Add to order", the detail screen closes using `Navigator.pop(context, selectedDrink)`. The Menu Screen awaits the result of `Navigator.push()` and, upon receiving the returned `Drink`, appends it directly to its owned `Order` state using `setState`.

When navigating to the Cart Screen, the Menu Screen passes its current `Order` object directly into the `CartScreen` constructor. Because objects in Dart are passed by reference, any modifications made inside the cart (such as removing an item) directly update the `Order` instance. Alternatively, `Navigator.pop(context)` can return the modified order back, or `setState` in the Menu Screen will reflect the changes upon returning.

---

### 3. A user taps "Place order". It takes two seconds. During those two seconds they tap it again. What happens, and what should happen? Be specific about what you will do to prevent the bad version.
If double-tapping is not explicitly handled, the `placeOrder` async function will be invoked twice. This results in firing two parallel asynchronous network requests to the server, which can cause duplicate charges, create multiple order IDs, and trigger race conditions or state crashes in the UI.

To prevent this:
1. Introduce a boolean flag in the state, such as `bool _isLoading = false;`.
2. When the user taps "Place order", immediately check if `_isLoading` is true. If it is, return early to ignore subsequent taps.
3. Set `_isLoading = true;` inside `setState()` right before starting the async operation.
4. Disable the button visually by setting its `onPressed` callback to `null` while `_isLoading` is true, or replace the button contents with a `CircularProgressIndicator`.
5. Wrap the call in a `try-catch-finally` block to ensure `_isLoading` is reset to `false` when the operation finishes (whether it succeeds or fails).