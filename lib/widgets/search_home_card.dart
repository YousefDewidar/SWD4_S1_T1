import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/constant.dart';
import 'package:recips_app/cubit/search_cubit.dart';
import 'package:recips_app/views/search_view.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, SearchView.id);
        },
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          color: Colors.white,
          elevation: 4,
          shadowColor: const Color.fromARGB(116, 212, 212, 212),
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              enabled: false,
              onChanged: (v) {
                BlocProvider.of<SearchCubit>(context).search(searchWord: v);
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search here',
                prefixIcon: Icon(
                  Icons.search,
                  color: kPrimaryColor,
                ),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 30, minHeight: 0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
