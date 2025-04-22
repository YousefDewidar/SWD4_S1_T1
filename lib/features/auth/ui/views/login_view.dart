import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitect/core/helpers/di.dart';
import 'package:habitect/core/layout/main_layout.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/core/utils/app_text_styles.dart';
import 'package:habitect/core/widgets/in_app_notification.dart';
import 'package:habitect/features/auth/domain/repo/auth_repo.dart';
import 'package:habitect/features/auth/ui/managers/login/login_cubit.dart';
import 'package:habitect/features/auth/ui/managers/login/login_state.dart';
import 'package:habitect/features/auth/ui/views/widgets/login/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const id = "LoginView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, MainLayout.id);
          } else if (state is LoginFailure) {
            showNotification(context, state.message, NotiType.error);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: const CircularProgressIndicator(
              color: AppColors.secondaryColor,
            ),
            inAsyncCall: state is LoginLoading,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text("Login", style: TextStyles.bold19),
                centerTitle: true,
              ),
              body: const SafeArea(child: LoginViewBody()),
            ),
          );
        },
      ),
    );
  }
}
