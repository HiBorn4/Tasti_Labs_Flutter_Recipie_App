// Importing the required dependencies and files
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import '../models/meal.dart';
import 'favourites_screen.dart';

// ignore: must_be_immutable
class TabsScreen extends StatefulWidget {
  final List<Meal> _favouriteMeals;
  const TabsScreen(this._favouriteMeals, {Key? key}) : super(key: key);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // Initializations
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  // Initializing the state of the widget
  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(widget._favouriteMeals), 'title': 'Favourites'},
    ];
    super.initState();
  }

  // Method for selecting a page
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // Building the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget?,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite")
        ],
      ),
    );
  }
}
