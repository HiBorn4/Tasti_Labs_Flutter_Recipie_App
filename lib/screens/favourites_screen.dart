// Importing the material.dart library from Flutter package which contains widgets implementing the Material
// Design.
import 'package:flutter/material.dart';

// Importing the Meal class and MealItem widget from their respective files located in the models and widgets
// directory
import '../models/meal.dart';
import '../widgets/meal_item.dart';

// Creating a FavouritesScreen widget which extends the StatelessWidget class.
// ignore: must_be_immutable
class FavouritesScreen extends StatelessWidget {
  // Declaring a list of Meal objects called favouriteMeals and defining a constructor for FavouritesScreen
  // that takes in favouriteMeals as an argument.
  List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals, {Key? key}) : super(key: key);

  // 1. Building the widget tree for the FavouritesScreen.
  // 2. If favouriteMeals is empty, display a Center widget with a Text widget that says
  // "You Have No Favourites YET - Start Adding Some!" using the const keyword for performance optimization.
  // 3. If favouriteMeals has items, build a ListView widget with ListView.builder() which displays a
  // MealItem widget for each item in the favouriteMeals list.
  // 4. The itemBuilder argument is a callback function that takes in ctx (context) and index as arguments,
  // and returns a MealItem widget with data obtained from favouriteMeals.
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
        child: Text("You Have No Favourites YET - Start Adding Some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
