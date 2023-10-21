// This line imports the required Flutter packages and files to create the widget.
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

// This comment instructs the compiler to ignore the immutability of the widget, which is required to pass
// mutable state between different parts of the widget tree.
// This line defines the FiltersScreen widget as a stateful widget.
// ignore: must_be_immutable
class FiltersScreen extends StatefulWidget {
  // This line defines a static constant variable 'routeName' to store the route name of the FiltersScreen.
  static const routeName = '/filters';

  // These lines define two instance variables: 'savFilters', which is a callback function to save the user's
  // filter preferences, and 'currentFilters', which is a Map containing the user's current filter preferences.
  final Function savFilters;
  Map<String, bool> currentFilters;

  // This line defines a constructor for the FiltersScreen widget and assigns the passed-in parameters to the instance variables.
  FiltersScreen(this.currentFilters, this.savFilters, {Key? key})
      : super(key: key);

  // This line overrides the createState() method to create a new instance of the FiltersScreen widget.
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // These lines define four instance variables to store the user's preferences for gluten-free, vegetarian,
  // vegan, and lactose-free meals.
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactose = false;

  // This line defines a new method 'buildSwitchList' to create a SwitchListTile widget.
  Widget buildSwitchList(String state, bool val, String substate,
      void Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(state),
      value: val,
      subtitle: Text(substate),
      onChanged: updateValue,
    );
  }

  // This method initializes the state of the FiltersScreen widget by setting the instance variables to the user's current filter preferences.
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactose = widget.currentFilters['lactose']!;
    super.initState();
  }

  // This method overrides the build method to create the UI for the FiltersScreen widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactose,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.savFilters(selectedFilters);
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Adjust your Meal Selection',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            buildSwitchList(
                "Gluten-Free", _glutenFree, "Only Include Gluten Free Food",
                (newValue) {
              setState(() {
                _glutenFree = newValue;
              });
            }),
            buildSwitchList(
                "Vegetarian", _vegetarian, "Only Include Vegetarian Food",
                (newValue) {
              setState(() {
                _vegetarian = newValue;
              });
            }),
            buildSwitchList("Vegan", _vegan, "Only Include Vegan Food",
                (newValue) {
              setState(() {
                _vegan = newValue;
              });
            }),
            buildSwitchList(
                "Lactose-Free", _lactose, "Only Include Lactose Free Food",
                (newValue) {
              setState(() {
                _lactose = newValue;
              });
            }),
          ],
        ))
      ]),
    );
  }
}
