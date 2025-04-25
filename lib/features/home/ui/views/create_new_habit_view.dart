import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/core/utils/app_text_styles.dart';
import 'package:habitect/features/home/ui/views/widgets/custom_button.dart';
import 'package:habitect/features/home/ui/views/widgets/custom_label_text.dart';
import 'package:habitect/generated/l10n.dart';

class CreateNewHabitView extends StatelessWidget {
  static const id = "create_habit";
  const CreateNewHabitView({super.key});

  InputDecoration getInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.grey, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).createNewHabitGoal,
                  style: TextStyles.bold19,
                  selectionColor: AppColors.blackColor,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.blackColor,
                    weight: 24,
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 4),
            CustomLabelText(text: S.of(context).yourGoal),
            const SizedBox(height: 4),
            TextField(decoration: getInputDecoration()),
            const SizedBox(height: 8),
            CustomLabelText(text: S.of(context).habitName),
            const SizedBox(height: 4),
            TextField(decoration: getInputDecoration()),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomLabelText(text: S.of(context).period),
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField<String>(
                    value: "1 Month",
                    decoration: getInputDecoration(),
                    dropdownColor: Colors.white,
                    items:
                        ["1 Month", "2 Months", "3 Months"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomLabelText(text: S.of(context).habitType),
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField<String>(
                    value: "Daily",
                    decoration: getInputDecoration(),
                    dropdownColor: Colors.white,
                    items:
                        ["Daily", "Weekly", "Monthly"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Center(
              child: CustomButtonWidget(
                onPressed: () {},
                text: S.of(context).createNew,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
