import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/cubit/search_cubit.dart';
import 'package:recips_app/widgets/home_app_bar.dart';
import 'package:recips_app/widgets/recommend_list_view.dart';
import 'package:recips_app/widgets/search_home_card.dart';
import 'package:recips_app/widgets/category_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'homeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: HomeAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchCard(),
                const Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                ),
                const CategoryListView(),
                const RecommendedListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
