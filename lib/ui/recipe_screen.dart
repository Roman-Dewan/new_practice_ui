import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/recipe.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  List<Recipe> _recipes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Recipe"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index){
            final recipe = _recipes[index];
            return ListTile(
              leading: Icon(Icons.restaurant_menu),
              title: Text(recipe.title),
              subtitle: Text(recipe.description),
            );
          }),
    );
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await jsonDecode(response);
    setState(() {
      _recipes = (data['recipes'] as List)
          .map((item) => Recipe.fromJson(item))
          .toList();
    });
  }
}
