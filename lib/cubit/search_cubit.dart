import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/cubit/search_state.dart';

import '../models/recipe_model.dart';
import '../networking/api_service.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  final ApiService _apiService = ApiService();
  var searchController = TextEditingController();

  Future<void> getSearch(String query) async {
    emit(GetSearchLoadingState());
    try {
      final response = await _apiService.get(
        endPoint: '/recipes?query=$query&include_categories=true',
      );

      final List<dynamic>? recipesJson = response.data["recipes"] as List<dynamic>?;

      if (recipesJson == null || recipesJson.isEmpty) {
        emit(GetSearchFailureState("No recipes found"));
        return;
      }

      final List<Recipe> recipes = recipesJson
          .map((json) => Recipe.fromJson(json as Map<String, dynamic>))
          .where((recipe) => recipe.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      debugPrint('The search results are: $recipes');

      emit(GetSearchSuccessState(recipes));
    } catch (e) {
      debugPrint('Search error: $e');
      emit(GetSearchFailureState(e.toString()));
    }
  }
}