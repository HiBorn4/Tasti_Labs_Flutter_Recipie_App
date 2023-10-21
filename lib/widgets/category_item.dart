// Importing the required flutter packages
import 'package:flutter/material.dart';

// Importing the CategoryMealsScreen from another file
import '../screens/category_meal_screen.dart';

// Creating a StatelessWidget for the CategoryItem
class CategoryItem extends StatelessWidget {
  // Defining the final variables required for the CategoryItem
  final String id;
  final String title;
  final Color color;
  // Defining a constructor for CategoryItem
  const CategoryItem(this.id, this.title, this.color, {Key? key})
      : super(key: key);
  // Creating a function to navigate to the CategoryMealsScreen upon selecting a category
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  // Overriding the build method to create the CategoryItem
  @override
  Widget build(BuildContext context) {
    // Returning an InkWell with the required properties
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
