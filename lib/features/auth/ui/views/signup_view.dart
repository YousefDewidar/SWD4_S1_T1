import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitect/core/helpers/di.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/core/widgets/custom_app_bar.dart';
import 'package:habitect/core/widgets/in_app_notification.dart';
import 'package:habitect/features/auth/domain/repo/auth_repo.dart';
import 'package:habitect/features/auth/ui/managers/signup/signup_cubit.dart';
import 'package:habitect/features/auth/ui/managers/signup/signup_state.dart';
import 'package:habitect/features/auth/ui/views/widgets/signup/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const id = "signup";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt.get<AuthRepo>()),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupFailure) {
            showNotification(context, state.message, NotiType.error);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.secondaryColor,
            ),
            inAsyncCall: state is SignupLoading,
            child: Scaffold(
              appBar: customAppBar(context, "signUp"),
              body: const SafeArea(child: SignupViewBody()),
            ),
          );
        },
      ),
    );
  }
}
