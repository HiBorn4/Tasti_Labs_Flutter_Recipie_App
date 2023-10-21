// Importing the necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/filters_screen.dart';

// Creating a stateless widget for the main drawer
class MainDrawer extends StatelessWidget {
  // Constructor for the MainDrawer widget
  const MainDrawer({Key? key}) : super(key: key);

  // Defining a reusable widget for list tiles with icons
  Widget buildListTile(
      String title, IconData icon, void Function()? tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  // Building the drawer widget
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Creating a column widget to hold the drawer contents
      child: Column(
        children: <Widget>[
          // Creating a container widget for the header of the drawer
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Adding a list tile widget for "Meals" with an onTap
          // function to navigate to the home page
          buildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          // Adding a list tile widget for "Filters" with an onTap
          // function to navigate to the filters screen
          buildListTile("Filters", Icons.filter_alt_outlined, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
// 1. This code defines a stateless widget for a drawer that is used
// to navigate between different sections of an app.
// 2. The widget contains a header with a title, and a list of
// clickable tiles that each represent a different section
// of the app.
// 3. When a tile is clicked, the user is taken to the
// corresponding screen or page.
// 4. The buildListTile function is used to create reusable list
// tile widgets with icons.
// 5. Overall, this code demonstrates best practices for building
// user interfaces in Flutter.