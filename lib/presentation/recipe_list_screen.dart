import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/recipe_list_state.dart';

class RecipeListScreen extends StatelessWidget {
  final RecipeListState state;
  final void Function() onRefresh;

  const RecipeListScreen({
    super.key,
    required this.state,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    // 상태가 변경되었을때 계속 호출되므로 ui 코드만 작성

    return Scaffold(
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                onRefresh();
              },
              child: ListView.builder(
                itemCount: state.recipes.length,
                itemBuilder: (_, index) {
                  final recipe = state.recipes[index];
                  return ListTile(
                    title: Text(recipe.name),
                    subtitle: Row(
                      children: [
                        Text('${recipe.category}/${recipe.chef}'),
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
            ),
    );
  }
}
