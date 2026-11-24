import 'package:material_ui/material_ui.dart';

class Recipe {
  const Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.durationMinutes,
    required this.rating,
    required this.emoji,
    required this.accentColor,
    required this.ingredients,
    required this.instructions,
  });

  final String id;
  final String name;
  final String category;
  final String description;
  final int durationMinutes;
  final double rating;
  final String emoji;
  final Color accentColor;
  final List<String> ingredients;
  final List<String> instructions;
}
