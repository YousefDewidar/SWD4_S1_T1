import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/cubit/recipe_state.dart';
import 'package:recips_app/models/recipe_model.dart';
import 'package:recips_app/networking/api_service.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeInitial());
  ApiService apiService = ApiService();

  Future<void> getRecommendedRecipe() async {
    emit(RecipeLoading());
    try {
      final response = await apiService.get(
          endPoint: '/recipes?sortBy=rating&order=desc&limit=25');
      List<Recipe> recipes = [];
      for (var recipe in response.data["recipes"]) {
        recipes.add(Recipe.fromJson(recipe));
      }
      emit(RecipeLoaded(recipes: recipes));
    } catch (e) { 
      log(e.toString());
      emit(RecipeError());
    }
  }
}
