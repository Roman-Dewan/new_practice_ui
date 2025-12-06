import 'package:flutter/material.dart';
import 'package:module22/ui/recipe_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecipeScreen(),
    );
  }
}
