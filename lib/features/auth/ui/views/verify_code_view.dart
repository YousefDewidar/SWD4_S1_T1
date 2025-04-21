import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitect/core/helpers/di.dart';
import 'package:habitect/core/widgets/custom_app_bar.dart';
import 'package:habitect/core/widgets/in_app_notification.dart';
import 'package:habitect/features/auth/domain/repo/auth_repo.dart';
import 'package:habitect/features/auth/ui/managers/verify/verify_cubit.dart';
import 'package:habitect/features/auth/ui/managers/verify/verify_state.dart';
import 'package:habitect/features/auth/ui/views/widgets/verify/verify_code_view_body.dart';
import 'package:habitect/features/home/ui/views/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key, required this.email});
  final String email;

  static const String id = "verify_code_view";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCubit(getIt.get<AuthRepo>()),
      child: BlocConsumer<VerifyCubit, VerifyState>(
        listener: (context, state) {
          if (state is VerifyEmailSuccess) {
            Navigator.pushReplacementNamed(context, HomeView.id);
          } else if (state is VerifyEmailFailure) {
            showNotification(context, state.message, NotiType.error);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is VerifyEmailLoading,
            child: Scaffold(
              appBar: customAppBar(context, "Verify Account"),
              body: SafeArea(child: VerifyCodeViewBody(email: email)),
            ),
          );
        },
      ),
    );
  }
}
