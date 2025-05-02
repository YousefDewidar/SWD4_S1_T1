import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/cubit/theme_cubit/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  void changeTheme(context) async {
    final pref = await SharedPreferences.getInstance();

    if (Theme.of(context).brightness == Brightness.light) {
      pref.setInt("theme", 1);

      emit(ThemeChanged(ThemeMode.dark));
    } else if (Theme.of(context).brightness == Brightness.dark) {
      pref.setInt("theme", 2);
      emit(ThemeChanged(ThemeMode.light));
    }
  }

  void getTheme() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey("theme")) {
      if (pref.getInt("theme") == 1) {
        emit(ThemeChanged(ThemeMode.dark));
      } else if (pref.getInt("theme") == 2) {
        emit(ThemeChanged(ThemeMode.light));
      }
    }
  }
}
