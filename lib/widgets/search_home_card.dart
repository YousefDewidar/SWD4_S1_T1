import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recips_app/views/search_view.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const SearchView(),
              duration: const Duration(milliseconds: 400),
            ),
          );
        },
        child: Card(
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
              enabled: false,
              onChanged: (v) {},
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: isDark ? Colors.white : Colors.grey,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.amber),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 30,
                  minHeight: 0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
