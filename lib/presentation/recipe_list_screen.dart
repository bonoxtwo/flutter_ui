import 'package:flutter/material.dart';
import 'package:flutter_ui/data/recipe_repository.dart';

import '../data/model/recipe_models.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  State<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  final RecipeRepository repository = RecipeRepository();
  List<Recipe> _recipes = [];
  bool isLoading = false;

  @override
  void initState() {
    //생명 주기 함수, 화면 생길때 한번만 호출
    super.initState();

    isLoading = true;
    // 생명 주기 함수의 경우, await - async 를 쓸수 없으니 then을 쓴다.
    repository.getRecipes().then((recipes) {
      setState(() {
        _recipes = recipes;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // 상태가 변경되었을때 계속 호출되므로 ui 코드만 작성

    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (_, index) {
                final recipe = _recipes[index];
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
