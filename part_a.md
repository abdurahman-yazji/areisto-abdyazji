# Part A — Answers
### 1. StatelessWidget vs StatefulWidget

A widget should be `StatelessWidget` when it just displays data that is given to it and never changes on its own. It should be `StatefulWidget` when it needs to remember something that can change over time — like which chip is selected, or how many items are in the order.

A good example from my screen is `DrinkCard`. Even after this week's changes, it stays stateless because it does not decide anything by itself — it just receives a `drink` object and an `onAdd` callback from its parent, displays what it is told, and calls back when the button is tapped. The card never needs to remember anything.

### 2. What does `setState` actually do?

`setState` does two things: it runs the code inside it to update the variable, and then it tells Flutter "something changed, please rebuild this widget". Flutter then calls `build()` again and the screen updates to show the new data.

If you change a variable without calling `setState`, the variable does change in memory — but Flutter does not know about it. Nothing tells the framework to rebuild, so the screen stays exactly the same. The data is updated but the user never sees it.

### 3. Where does the order have to live?

The order has to live in `MenuScreen`, which is the closest parent that contains both `DrinkCard` and `BottomBar`. This is called "lifting state up" — when two widgets need to share the same data, the state goes to their nearest common parent.

The order cannot live inside `DrinkCard` because a card only knows about itself. If the order lived inside one card, the `BottomBar` would have no way to read it — widgets cannot reach into their siblings to get data. The only way to share data between widgets is to move it up to the parent and pass it down.