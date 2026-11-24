import 'package:material_ui/material_ui.dart';
import 'package:task1/models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({required this.recipe, super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe details'),
        backgroundColor: const Color(0xFFFFF9F3),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 210,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: recipe.accentColor,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Text(recipe.emoji, style: const TextStyle(fontSize: 92)),
              ),
              const SizedBox(height: 23),
              Text(
                recipe.category.toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFFE86A33),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                recipe.name,
                style: const TextStyle(
                  fontSize: 30,
                  height: 1.15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                recipe.description,
                style: TextStyle(
                  color: Colors.brown.shade400,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 17),
              Row(
                children: [
                  const Icon(
                    Icons.schedule_rounded,
                    size: 18,
                    color: Color(0xFFE86A33),
                  ),
                  const SizedBox(width: 6),
                  Text('${recipe.durationMinutes} minutes'),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.star_rounded,
                    size: 19,
                    color: Color(0xFFF3AC3D),
                  ),
                  const SizedBox(width: 4),
                  Text(recipe.rating.toStringAsFixed(1)),
                ],
              ),
              const SizedBox(height: 27),
              const Text(
                'Ingredients',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 12),
              ...recipe.ingredients.map(
                (ingredient) => Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle_rounded,
                        size: 19,
                        color: Color(0xFFE86A33),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          ingredient,
                          style: const TextStyle(fontSize: 15, height: 1.35),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'How to make it',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 14),
              ...recipe.instructions.indexed.map(
                (entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 29,
                        height: 29,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFE5D5),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${entry.$1 + 1}',
                          style: const TextStyle(
                            color: Color(0xFFE86A33),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(width: 11),
                      Expanded(
                        child: Text(
                          entry.$2,
                          style: const TextStyle(fontSize: 15, height: 1.45),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
