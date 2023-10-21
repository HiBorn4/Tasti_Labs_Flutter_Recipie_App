import 'package:flutter/material.dart';

enum Complexity {
  // ignore: constant_identifier_names
  Simple,
  // ignore: constant_identifier_names
  Challenging,
  // ignore: constant_identifier_names
  Hard,
}

enum Affordability {
  // ignore: constant_identifier_names
  Affordable,
  // ignore: constant_identifier_names
  Pricey,
  // ignore: constant_identifier_names
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal (
    // ignore: invalid_required_positional_param
    @required this.id,
    // ignore: invalid_required_positional_param
    @required this.categories,
    // ignore: invalid_required_positional_param
    @required this.title,
    // ignore: invalid_required_positional_param
    @required this.affordability,
    // ignore: invalid_required_positional_param
    @required this.complexity,
    // ignore: invalid_required_positional_param
    @required this.imageUrl,
    // ignore: invalid_required_positional_param
    @required this.duration,
    // ignore: invalid_required_positional_param
    @required this.ingredients,
    // ignore: invalid_required_positional_param
    @required this.steps,
    // ignore: invalid_required_positional_param
    @required this.isGlutenFree,
    // ignore: invalid_required_positional_param
    @required this.isVegan,
    // ignore: invalid_required_positional_param
    @required this.isVegetarian,
    // ignore: invalid_required_positional_param
    @required this.isLactoseFree,
  );
}