import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitect/core/widgets/custom_button.dart';
import 'package:habitect/core/widgets/in_app_notification.dart';
import 'package:habitect/core/widgets/space.dart';
import 'package:habitect/features/auth/ui/managers/signup/signup_cubit.dart';
import 'package:habitect/features/auth/ui/managers/signup/signup_state.dart';
import 'package:habitect/features/auth/ui/views/verify_code_view.dart';
import 'package:habitect/features/auth/ui/views/widgets/login/custom_text_field.dart';
import 'package:habitect/features/auth/ui/views/widgets/login/password_field.dart';
import 'package:habitect/features/auth/ui/views/widgets/signup/allready_have_acc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  final TextEditingController _nameCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isTermsEnabeld = false;

  @override
  void dispose() {
    _emailCon.dispose();
    _passCon.dispose();
    _nameCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SpaceV(20),
              CustomTextField(controller: _nameCon, hint: "Enter your name"),
              const SpaceV(16),
              CustomTextField(controller: _emailCon, hint: "Enter your email"),
              const SpaceV(16),
              PasswordField(controller: _passCon),
              const SpaceV(30),
              BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (state is SignupSuccess) {
                    showNotification(
                      context,
                      "Account created successfully",
                      NotiType.success,
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => VerifyCodeView(email: _emailCon.text),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    isEnabled: isTermsEnabeld,
                    title: "Sign up",
                    onPressed:
                        !isTermsEnabeld
                            ? null
                            : () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<SignupCubit>()
                                    .signupWithEmailAndPassword(
                                      email: _emailCon.text,
                                      password: _passCon.text,
                                      name: _nameCon.text,
                                    );
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                  );
                },
              ),
              const SpaceV(30),
              const AllreadyHaveAcc(),
            ],
          ),
        ),
      ),
    );
  }
}
