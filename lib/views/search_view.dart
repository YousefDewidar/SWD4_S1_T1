import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/cubit/search_cubit.dart';
import 'package:recips_app/cubit/search_state.dart';
import 'package:recips_app/widgets/recipe_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = "SearchView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = BlocProvider.of<SearchCubit>(context);

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10.0,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: cubit.searchController,
                          autofocus: true,
                          onChanged: (value) {
                            cubit.getSearch(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search...',
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (state is GetSearchLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is GetSearchSuccessState) {
                          return ListView.builder(
                            padding: const EdgeInsets.only(left: 2, top: 10),
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.recipes.length,
                            itemBuilder: (context, index) => Column(
                              children: [
                                RecipeCard(recipe: state.recipes[index], index: index),
                                const SizedBox(height: 40),
                              ],
                            ),
                          );
                        } else if (state is GetSearchFailureState) {
                          return Center(child: Text("Error: ${state.error}"));
                        }
                        return Center(child: Text("Start searching for recipes!"));
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}