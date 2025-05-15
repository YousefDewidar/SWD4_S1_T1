import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:recips_app/constant.dart';
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
      child: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          var cubit = BlocProvider.of<SearchCubit>(context);
          bool isDark = Theme.of(context).brightness == Brightness.dark;
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Search",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    color: isDark ? const Color(0x2C9E9E9E) : Colors.white,
                    elevation: isDark ? 0 : 6,
                    shadowColor: const Color.fromARGB(116, 212, 212, 212),
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        onChanged: (value) {
                          if (value.isEmpty) {
                            cubit.clearSearch();
                          } else {
                            cubit.getSearch(value);
                          }
                        },
                        controller: cubit.searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            color: isDark ? Colors.white : Colors.grey,
                          ),
                          prefixIcon: Icon(Icons.search, color: kPrimaryColor),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 30,
                            minHeight: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (state is GetSearchLoadingState) {
                          return Center(
                            child: Lottie.asset("assets/search_animation.json"),
                          );
                        } else if (state is GetSearchSuccessState) {
                          return ListView.builder(
                            padding: const EdgeInsets.only(left: 2, top: 10),
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.recipes.length,
                            itemBuilder:
                                (context, index) => Column(
                                  children: [
                                    RecipeCard(
                                      recipe: state.recipes[index],
                                      index: index,
                                    ),
                                    const SizedBox(height: 40),
                                  ],
                                ),
                          );
                        } else if (state is GetSearchFailureState) {
                          return Center(child: Text(state.error));
                        }
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/search_image.webp",
                              height: 200,
                              width: 200,
                            ),
                            const SizedBox(height: 25),
                            Text(
                              "Start searching for recipes!",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color:
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white70
                                        : Colors.black54,
                              ),
                            ),
                          ],
                        );
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
