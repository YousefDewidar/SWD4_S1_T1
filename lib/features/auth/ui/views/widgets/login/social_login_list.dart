import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitect/features/auth/ui/managers/login/login_cubit.dart';
import 'package:habitect/features/auth/ui/views/widgets/login/social_login_card.dart';

class SocialLoginList extends StatelessWidget {
  const SocialLoginList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginCard(
          icon: "assets/images/Gogle.png",
          title: "Sign in with Google",
          onTap: () {
            context.read<LoginCubit>().loginWithGoogle();
          },
        ),
      ],
    );
  }
}
