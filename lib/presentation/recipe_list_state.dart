import '../data/model/recipe_models.dart';

void main() {
  var state = RecipeListState(
    recipes: [],
    isLoading: false,
  );

  state = RecipeListState(
    recipes: state.recipes,
    isLoading: true,
  );

  state = state.copyWith(
    isLoading: true,
  );
  state = state.copyWith(
    recipes: [],
  );
  state = state.copyWith(
    isLoading: true,
    recipes: [],
  );
}

class RecipeListState {
  final List<Recipe> recipes;
  final bool isLoading;

  RecipeListState({
    required this.recipes,
    required this.isLoading,
  });

  // Shallow copy function
  RecipeListState copyWith({
    List<Recipe>? recipes,
    bool? isLoading,
  }) {
    return RecipeListState(
      recipes: List.unmodifiable(recipes ?? this.recipes),
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
