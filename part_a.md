# Part A — Three questions from last week
___
## 1. What does the late keyword do? When is it genuinely useful, and what can go wrong if you use it carelessly?  


The `late` keyword tells Dart that a non-nullable variable will be initialized after its declaration before it is ever read. It is genuinely useful when an expensive value needs to be initialized lazily on first access, or when setting up values during an initialization phase like `initState()`.
 ___
 ___



 ## 2. From the compiler's point of view, what is the difference between String and String? What can you do with one that you cannot do with the other without extra work?

From the compiler's perspective, String is a non-nullable type guaranteed to hold an actual text `string`, whereas` String?` is a nullable union type that can hold either a `String` or `null`. You can directly call string properties and methods  (like `.length` or `.toUpperCase()`) on a `String`. With a `String?`, you cannot access those members directly without extra work such as checking for `null`, using the null-aware operator (`?.`), or supplying a default fallback (`??`).
___
___
## 3. What is a getter? Look back at your own coffee shop code from last week and find one place where a getter is a better choice than either a stored field or a normal method. Show the line, and explain why.
A getter is a special class method that behaves syntactically like a readable property, providing dynamic computation on access without holding its own stored value. 
In  coffee shop code,
```dart 
double get subtotal => drinks.fold(0, (total, drink) => total + drink.finalPrice);
```
is a clear example where a getter is superior to a stored variable or normal method. A stored field would require manual, error-prone state synchronization every time `drinks.add()` or `drinks.remove()` is called, while a getter guarantees the price is always accurate and up to date without adding extra method invocation syntax like `order.subtotal()`.
