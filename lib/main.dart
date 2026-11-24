import 'package:material_ui/material_ui.dart';
import 'package:task1/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFFE86A33);

    return MaterialApp(
      title: 'RecipeRadar',
      debugShowCheckedModeBanner: false,
     
      home: const HomeScreen(),
    );
  }
}
