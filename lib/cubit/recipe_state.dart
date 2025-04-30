import 'package:recips_app/models/recipe_model.dart';

sealed class RecipeState {}

final class RecipeInitial extends RecipeState {}

final class RecipeLoaded extends RecipeState {
  final List<Recipe> recipes;
  RecipeLoaded({required this.recipes});
}

final class RecipeError extends RecipeState {}

final class RecipeLoading extends RecipeState {}
