import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/cubit/search_cubit.dart';
import 'package:recips_app/cubit/search_state.dart';
import 'package:recips_app/helper/get_recipe_data.dart';
import 'package:recips_app/widgets/type_food_card.dart';

class TypeFoodView extends StatefulWidget {
  const TypeFoodView({
    super.key,
  });

  @override
  State<TypeFoodView> createState() => _TypeFoodViewState();
}

class _TypeFoodViewState extends State<TypeFoodView> {
  List newRecpieList = recipeDetails();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 18),
      child: SizedBox(
        height: 155,
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            if (state is SearchDoneState) {
              newRecpieList = recipeDetails().where((element) {
                if (element.name.toLowerCase() ==
                    BlocProvider.of<SearchCubit>(context).word) {
                  return true;
                } else {
                  return false;
                }
              }).toList();
            } else if (state is SearchFailerState) {
              newRecpieList = recipeDetails();
            }
          },
          builder: (context, state) {
            return ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: newRecpieList.length,
              itemBuilder: (context, index) {
                return TypeFoodCard(rec: newRecpieList[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
