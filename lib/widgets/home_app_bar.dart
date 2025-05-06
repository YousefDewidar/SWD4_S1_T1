import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/constant.dart';
import 'package:recips_app/cubit/theme_cubit/theme_cubit.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Image.asset("assets/recipe_logo.png", width: 48),
          const SizedBox(width: 10),
          const Text(
            'Yummy ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          const Text(
            'Recipes',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: kPrimaryColor,
            ),
          ),
          Spacer(),
          IconButton.filled(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Colors.amber.withValues(alpha: 0.1),
              ),
            ),
            onPressed: () {
              context.read<ThemeCubit>().changeTheme(context);
            },
            icon: Icon(
              Theme.of(context).brightness == Brightness.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
