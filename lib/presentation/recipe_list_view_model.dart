//mvvm model
import 'package:flutter/material.dart';
import 'package:flutter_ui/presentation/recipe_list_state.dart';
import '../data/model/recipe_models.dart';
import '../data/recipe_repository.dart';

class RecipeListViewModel with ChangeNotifier {
  //mixin concept
  final RecipeRepository _repository;
  RecipeListState _state = RecipeListState(
    recipes: [],
    isLoading: false,
  );

  RecipeListState get state => _state;

  RecipeListViewModel(this._repository) {
    loadData();
  }

  Future<void> loadData() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners(); // change notifier

    _state = _state.copyWith(
      recipes: await _repository.getRecipes(),
      isLoading: false,
    );
    notifyListeners(); // change notifier
  }
}
