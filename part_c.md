# Part C — Where the pain is

## Widget Tree

```
MenuScreen        ← state lives here (_selectedCategory, _order)
├── CategoryChips ← receives: selected, onSelect
├── DrinkGrid     ← receives: drinks, order, onAdd
│   └── DrinkCard ← receives: drink, onAdd, count
└── BottomBar     ← receives: itemCount, total
```

---

## 1. How many widgets does a value pass through without using it?

`DrinkGrid` is a clear example of this. It receives the `order` object not because it needs to display the order itself, but only to pass `order.countOf(drink)` down to each `DrinkCard`. It is just a middleman. The same happens with `onAdd` — `DrinkGrid` does not add drinks, it just passes the function through to the card that actually calls it.

---

## 2. If we added a cart screen showing the same order, what would change?

We would have to pass the `_order` object into the new cart screen as well, either through the constructor or through navigation arguments. If we later added a third screen that also needed the order, we would have to pass it there too. Every new screen that needs the order means more passing, more constructors, and more places to update if anything changes. It works, but it does not scale well.

---

## 3. What was the most annoying part?

The most annoying part was that `DrinkGrid` had to receive and forward data it never actually uses itself. It felt wrong — the grid does not care about the order total, it does not care about `onAdd` in any meaningful way, it is just carrying things for someone else. Every time I added a new parameter to `DrinkCard`, I had to go back and add it to `DrinkGrid` too just so it could pass it down. It felt like I was writing the same line in three different places for no reason other than the fact that the data happened to live far away from where it was needed.
