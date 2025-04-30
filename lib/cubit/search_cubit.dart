import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(InitialState());
  String word = '';

  search({required String searchWord}) {
    if (searchWord.isNotEmpty) {
      word = searchWord;
      emit(SearchDoneState());
    } else {
      emit(SearchFailerState());
    }
  }
}
