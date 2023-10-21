// Importing necessary packages and files
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../models/meal.dart';

// A stateful widget to display a list of meals for a specific category
// ignore: must_be_immutable
class CategoryMealsScreen extends StatefulWidget {
  static const routeName =
      '/category-meals'; // Static route name for easy navigation
  List<Meal> availableMeals; // List of available meals for all categories
  CategoryMealsScreen(this.availableMeals, {Key? key}) : super(key: key);
  @override
  State<CategoryMealsScreen> createState() =>
      _CategoryMealsScreenState(); // Creating a new state for this widget
}

// The state class for CategoryMealsScreen
class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle; // Title of the category being displayed
  late List<Meal>
      displayedMeal; // List of meals for the category being displayed
  var _loadedinitData =
      false; // A flag to track if the initial data has been loaded or not
  // This function is called whenever the dependencies of this widget change
  @override
  void didChangeDependencies() {
    if (!_loadedinitData) {
      // If the initial data has not been loaded
      final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<
          String, String>; // Extracting the arguments passed to this widget
      categoryTitle = routeArgs['title']!; // Setting the category title
      final categoryId = routeArgs['id']; // Extracting the category id
      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(
            categoryId); // Filtering the list of meals to only those that belong to the current category
      }).toList();
      _loadedinitData = true; // Setting the flag to true after loading the data
    }
    super.didChangeDependencies();
  }

  // This function builds the UI of this widget
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            categoryTitle), // Setting the title of the app bar to the category title
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeal[index]
                  .id, // Passing the meal id to the MealItem widget
              title: displayedMeal[index]
                  .title, // Passing the meal title to the MealItem widget
              imageUrl: displayedMeal[index]
                  .imageUrl, // Passing the meal image URL to the MealItem widget
              duration: displayedMeal[index]
                  .duration, // Passing the meal duration to the MealItem widget
              complexity: displayedMeal[index]
                  .complexity, // Passing the meal complexity to the MealItem widget
              affordability: displayedMeal[index]
                  .affordability, // Passing the meal affordability to the MealItem widget
            );
          },
          itemCount: displayedMeal.length,
        ), // Building a list view of the meals for the current category
      ),
    );
  }
}
