abstract class SearchStates{}

class SearchInitialState extends SearchStates{}

class GetSearchLoadingState extends SearchStates{}

class GetSearchSuccessState extends SearchStates{
  final List<dynamic> recipes;
  GetSearchSuccessState(this.recipes);
}

class GetSearchFailureState extends SearchStates{
  final String error;
  GetSearchFailureState(this.error);

}