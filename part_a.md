# Part A — Two Ideas, Three Questions

### 1. Single Responsibility Principle (SRP)
It means every widget should do only one job. If a widget does two things, it becomes hard to fix or update. In my Week 2 code, `DrinkGrid` had two jobs: holding the drink data and displaying the grid UI. This means it had two reasons to change (data changes or layout changes).

### 2. Open / Closed Principle (OCP)
It means you can add new features by adding new code, without touching the old working code. For example, in a coffee shop app, if we want to add a "Student Discount", we should create a new discount class instead of editing the main checkout code. This avoids breaking features that already work.

### 3. Flutter Layout Rule ("Constraints go down. Sizes go up. Parent sets position.")
This describes how Flutter places elements on screen. First, the parent tells the child "here is the maximum space you can use" (Constraints go down). Next, the child decides its own size within those limits (Sizes go up). Finally, the parent places the child in the right spot on the screen (Parent sets position). For example, the screen limits the width of `OfferBanner`, the banner decides its height based on its text, and the page places it below the categories.