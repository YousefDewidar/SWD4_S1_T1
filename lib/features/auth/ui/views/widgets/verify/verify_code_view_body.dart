import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/core/utils/app_text_styles.dart';
import 'package:habitect/core/widgets/custom_button.dart';
import 'package:habitect/core/widgets/space.dart';
import 'package:habitect/features/auth/ui/managers/verify/verify_cubit.dart';
import 'package:habitect/features/auth/ui/views/widgets/verify/otp_widget.dart';

class VerifyCodeViewBody extends StatefulWidget {
  const VerifyCodeViewBody({super.key, required this.email});
  final String email;

  @override
  State<VerifyCodeViewBody> createState() => _VerifyCodeViewBodyState();
}

class _VerifyCodeViewBodyState extends State<VerifyCodeViewBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
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
              const SpaceV(10),
              Text(
                'Code has been sent to ${widget.email}',
                style: TextStyles.semiBold16.copyWith(
                  color: AppColors.greyColor,
                ),
              ),
              const SpaceV(30),
              OtpWidget(otpControllers: _otpControllers),
              const SpaceV(30),
              CustomButton(
                title: "Verify",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final code =
                        _otpControllers.map((code) => code.text).join();
                    context.read<VerifyCubit>().verifyEmail(
                      code: code,
                      email: widget.email,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SpaceV(25),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    context.read<VerifyCubit>().resendOtp(email: widget.email);
                  },
                  child: Text(
                    "Resend Code",
                    textAlign: TextAlign.end,
                    style: TextStyles.semiBold16.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
