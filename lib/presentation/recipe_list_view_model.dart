//mvvm model
import 'package:flutter/material.dart';
import '../data/model/recipe_models.dart';
import '../data/recipe_repository.dart';

class RecipeListViewModel with ChangeNotifier { //mixin concept
  final RecipeRepository _repository = RecipeRepository();
  List<Recipe> _recipes = [];
  bool _isLoading = false;

  RecipeListViewModel(){
    loadData();
  }

  Future<void> loadData() async{
    _isLoading = true;
    notifyListeners(); // change notifier

    _recipes = await _repository.getRecipes();
    _isLoading = false;
    notifyListeners(); // change notifier
  }

  //getter
  bool get isLoading => _isLoading;
  List<Recipe> get recipes => List.unmodifiable(_recipes); // reference수정도 못하도록 변경
  RecipeRepository get repository => _repository;
}
