import 'package:flutter/material.dart';
import 'package:flutter_ui/data/recipe_repository.dart';
import 'package:flutter_ui/presentation/recipe_list_view_model.dart';

import '../data/model/recipe_models.dart';

class RecipeListScreen extends StatelessWidget {
  final List<Recipe> recipes;
  final bool isLoading;

  const RecipeListScreen({
    super.key,
    required this.recipes,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    // 상태가 변경되었을때 계속 호출되므로 ui 코드만 작성

    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (_, index) {
                final recipe = recipes[index];
                return ListTile(
                  title: Text(recipe.name),
                  subtitle: Row(
                    children: [
                      Text(recipe.category),
                      Text('/'),
                      Text(recipe.chef),
                    ],
                  ),
                  leading: Image.network(
                    recipe.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
    );
  }
}
