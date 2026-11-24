import 'package:material_ui/material_ui.dart';
import 'package:task1/models/recipe.dart';
import 'package:task1/screens/recipe_detail_screen.dart';
import 'package:task1/widgets/recipe_card.dart';

const _recipes = <Recipe>[
  Recipe(
    id: 'avocado-toast',
    name: 'Avocado Toast',
    category: 'Breakfast',
    description: 'Creamy avocado, chili flakes and a squeeze of lemon.',
    durationMinutes: 15,
    rating: 4.8,
    emoji: '🥑',
    accentColor: Color(0xFFE4F0D8),
    ingredients: [
      '2 slices sourdough bread',
      '1 ripe avocado',
      '½ lemon',
      'Chili flakes',
      'Sea salt',
    ],
    instructions: [
      'Toast the sourdough until golden and crisp.',
      'Mash the avocado with lemon juice and a pinch of salt.',
      'Spread over the toast and finish with chili flakes.',
    ],
  ),
  Recipe(
    id: 'lemon-herb-pasta',
    name: 'Lemon Herb Pasta',
    category: 'Lunch',
    description: 'A bright, buttery pasta tossed with fresh herbs.',
    durationMinutes: 25,
    rating: 4.9,
    emoji: '🍝',
    accentColor: Color(0xFFFFE6C7),
    ingredients: [
      '250 g linguine',
      '1 lemon',
      '2 tbsp butter',
      'Fresh parsley',
      '½ cup parmesan',
    ],
    instructions: [
      'Cook the linguine in salted water until al dente.',
      'Melt butter in a pan and stir in lemon zest and juice.',
      'Toss the pasta with the lemon butter, parsley and parmesan.',
    ],
  ),
  Recipe(
    id: 'honey-salmon',
    name: 'Honey Glazed Salmon',
    category: 'Dinner',
    description: 'Tender salmon with a sweet and savory glaze.',
    durationMinutes: 30,
    rating: 4.7,
    emoji: '🐟',
    accentColor: Color(0xFFFFE0D5),
    ingredients: [
      '2 salmon fillets',
      '2 tbsp honey',
      '1 tbsp soy sauce',
      '1 garlic clove',
      'Steamed rice',
    ],
    instructions: [
      'Whisk honey, soy sauce and minced garlic together.',
      'Brush the glaze over the salmon and bake at 200°C for 12–15 minutes.',
      'Serve over steamed rice with the remaining glaze.',
    ],
  ),
  Recipe(
    id: 'berry-pancakes',
    name: 'Berry Pancakes',
    category: 'Breakfast',
    description: 'Fluffy pancakes topped with fresh berries.',
    durationMinutes: 20,
    rating: 4.8,
    emoji: '🥞',
    accentColor: Color(0xFFF4E4F1),
    ingredients: [
      '1 cup flour',
      '1 egg',
      '¾ cup milk',
      '1 tbsp sugar',
      'Fresh berries',
    ],
    instructions: [
      'Whisk flour, egg, milk and sugar into a smooth batter.',
      'Pour small rounds into a warm buttered pan and flip when bubbles form.',
      'Stack the pancakes and top with fresh berries.',
    ],
  ),
  Recipe(
    id: 'green-smoothie',
    name: 'Green Glow Smoothie',
    category: 'Breakfast',
    description: 'A refreshing blend of spinach, banana and mango.',
    durationMinutes: 10,
    rating: 4.6,
    emoji: '🥤',
    accentColor: Color(0xFFDDF0E4),
    ingredients: [
      '1 banana',
      '½ cup mango',
      '1 handful spinach',
      '¾ cup oat milk',
      '1 tsp honey',
    ],
    instructions: [
      'Add all ingredients to a blender.',
      'Blend until smooth, adding more oat milk to adjust the texture.',
      'Pour into a chilled glass and enjoy right away.',
    ],
  ),
  Recipe(
    id: 'chocolate-cake',
    name: 'Chocolate Mug Cake',
    category: 'Dessert',
    description: 'A rich, fudgy chocolate treat ready in minutes.',
    durationMinutes: 8,
    rating: 4.9,
    emoji: '🍰',
    accentColor: Color(0xFFEADFD8),
    ingredients: [
      '4 tbsp flour',
      '2 tbsp cocoa powder',
      '2 tbsp sugar',
      '3 tbsp milk',
      '1 tbsp chocolate chips',
    ],
    instructions: [
      'Mix the flour, cocoa, sugar and milk in a microwave-safe mug.',
      'Fold in the chocolate chips.',
      'Microwave for 60–90 seconds, then let it cool briefly.',
    ],
  ),
];

const _categories = ['All', 'Breakfast', 'Lunch', 'Dinner', 'Dessert'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  final _favorites = <String>{};
  String _selectedCategory = 'All';
  String _searchQuery = '';
  bool _showFavoritesOnly = false;

  List<Recipe> get _filteredRecipes {
    final query = _searchQuery.trim().toLowerCase();

    return _recipes.where((recipe) {
      final matchesCategory =
          _selectedCategory == 'All' || recipe.category == _selectedCategory;
      final matchesFavorites =
          !_showFavoritesOnly || _favorites.contains(recipe.id);
      final searchableText = [
        recipe.name,
        recipe.category,
        recipe.description,
        ...recipe.ingredients,
      ].join(' ').toLowerCase();

      return matchesCategory &&
          matchesFavorites &&
          (query.isEmpty || searchableText.contains(query));
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openRecipe(Recipe recipe) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => RecipeDetailScreen(recipe: recipe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipes = _filteredRecipes;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 16, 22, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE5D5),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.radar_rounded,
                      color: Color(0xFFE86A33),
                    ),
                  ),
                  const SizedBox(width: 11),
                  const Text(
                    'RecipeRadar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: _showFavoritesOnly
                        ? 'Show all recipes'
                        : 'Favorites',
                    onPressed: () {
                      setState(() => _showFavoritesOnly = !_showFavoritesOnly);
                    },
                    icon: Icon(
                      _showFavoritesOnly
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: _showFavoritesOnly
                          ? const Color(0xFFE86A33)
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 27),
              const Text(
                'Find your next\nfavorite meal',
                style: TextStyle(
                  fontSize: 34,
                  height: 1.12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                'Fresh ideas for whatever you’re craving.',
                style: TextStyle(fontSize: 15, color: Colors.brown.shade400),
              ),
              const SizedBox(height: 22),
              TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _searchQuery = value),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search recipes or ingredients',
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _searchQuery.isEmpty
                      ? null
                      : IconButton(
                          tooltip: 'Clear search',
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                          icon: const Icon(Icons.close_rounded),
                        ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0xFFF0E8DF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Color(0xFFE86A33),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 9),
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    final selected = category == _selectedCategory;

                    return ChoiceChip(
                      label: Text(category),
                      selected: selected,
                      showCheckmark: false,
                      onSelected: (value) {
                        setState(() => _selectedCategory = category);
                      },
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.brown.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: const Color(0xFFE86A33),
                      side: BorderSide(
                        color: selected
                            ? const Color(0xFFE86A33)
                            : const Color(0xFFF0E8DF),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Recipes for you',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    '${recipes.length} ${recipes.length == 1 ? 'recipe' : 'recipes'}',
                    style: TextStyle(
                      color: Colors.brown.shade400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              if (recipes.isEmpty)
                _EmptyResults(
                  onClear: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                      _selectedCategory = 'All';
                      _showFavoritesOnly = false;
                    });
                  },
                )
              else
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recipes.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 13),
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return RecipeCard(
                      recipe: recipe,
                      isFavorite: _favorites.contains(recipe.id),
                      onTap: () => _openRecipe(recipe),
                      onFavoritePressed: () {
                        setState(() {
                          if (!_favorites.add(recipe.id)) {
                            _favorites.remove(recipe.id);
                          }
                        });
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyResults extends StatelessWidget {
  const _EmptyResults({required this.onClear});

  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFF0E8DF)),
      ),
      child: Column(
        children: [
          const Text('🔎', style: TextStyle(fontSize: 40)),
          const SizedBox(height: 12),
          const Text(
            'No recipes found',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            'Try another search or choose a different category.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.brown.shade400),
          ),
          const SizedBox(height: 16),
          TextButton(onPressed: onClear, child: const Text('Clear filters')),
        ],
      ),
    );
  }
}
