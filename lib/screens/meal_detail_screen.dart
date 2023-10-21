// Importing required libraries
import 'package:flutter/material.dart'; // Material Design UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
import 'package:flutter_complete_guide/data/dummy_data.dart'; // Custom data file for dummy meals data.

// Defining a Stateful Widget for displaying meal details.
// ignore: must_be_immutable
class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail'; // Unique route name for navigation.
  Function favourite; // A function to set favourites.
  final Function
      _isMealFavourite; // A function to check if a meal is favourite.

  // Constructor for the MealDetailScreen widget.
  MealDetailScreen(this.favourite, this._isMealFavourite, {Key? key})
      : super(key: key);

  // A widget to build section title with specified text.
  Widget buildSectionTitle(BuildContext context, String text) {
    return SizedBox(
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium, // Styling for the text as per the current theme.
      ),
    );
  }

  // A widget to build a container with specified child widget.
  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the container.
        border: Border.all(
          color: Colors.grey,
        ), // Border styling.
        borderRadius: BorderRadius.circular(10), // Border radius.
      ),
      margin: const EdgeInsets.all(10), // Margin for the container.
      padding: const EdgeInsets.all(10), // Padding for the container.
      height: 200, // Height for the container.
      width: 300, // Width for the container.
      child: child, // Child widget for the container.
    );
  }

  // Build method for the MealDetailScreen widget.
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments
        as String; // Getting the meal ID from the navigation arguments.
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) =>
        meal.id == mealId); // Getting the meal object using the meal ID.

    // Creating a Scaffold widget for the screen with required elements.
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ), // App bar with the title of the selected meal.
      body: SingleChildScrollView(
        // Scrollable container for the body.
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300, // Height for the image container.
              width: double.infinity, // Width for the image container.
              child: Image.network(
                // Image widget for displaying the meal image.
                selectedMeal.imageUrl, // URL for the image.
                fit: BoxFit.cover, // Fitting the image within the container.
              ),
            ),
            buildSectionTitle(
                context, "Ingredients"), // Section title for ingredients.
            buildContainer(ListView.builder(
              // ListView for displaying the list of ingredients.
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context)
                    .colorScheme
                    .secondary, // Styling for the card background color.
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedMeal.ingredients[
                        index])), // Displaying the text for the ingredient.
              ),
              itemCount: selectedMeal.ingredients
                  .length, // Total number of ingredients in the list.
            )),
            buildSectionTitle(context, "Steps"), // Section title for steps.
            buildContainer(ListView.builder(
              // ListView for displaying the list of steps.
              // This line of code creates a container with a ListView.builder widget that displays the
              // list of steps for the selected meal.
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  const Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            )),
            // This line of code closes the children of the Column widget, which includes the section
            // titles, the container with the ingredients, and the container with the steps.
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // This line of code creates a FloatingActionButton
        onPressed: () => favourite(
            mealId), // widget that allows the user to add the selected
        child: Icon(
          // meal to their favorites list.
          _isMealFavourite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
