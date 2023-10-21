// This line imports the core Flutter Material library
import 'package:flutter/material.dart';
// These lines import the dummy data and category item widgets used in this file
import '../data/dummy_data.dart';
import '../widgets/category_item.dart';

// This class represents the Categories screen widget
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  // This method builds the widget
  @override
  Widget build(BuildContext context) {
    // This widget returns a GridView widget with a grid of CategoryItems
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              catData.id,
              catData.title,
              catData.color,
            ),
          )
          .toList(),
    );
  }
}
