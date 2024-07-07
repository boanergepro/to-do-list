import 'package:flutter/material.dart';
import 'package:to_do_list/src/presentation/widgets/custom_contained_button.dart';
import 'package:to_do_list/src/presentation/widgets/custom_text_field.dart';
import 'package:to_do_list/src/presentation/widgets/date_field.dart';
import 'package:to_do_list/src/core/globals/quick_access_controllers.dart';

enum ActionBottomSheet { create, edit }

class BottomSheetFormWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPress;

  const BottomSheetFormWidget({
    super.key,
    required this.title,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CustomField(
            labelText: 'Description',
            controller: taskController.descriptionController,
          ),
          const SizedBox(
            height: 25,
          ),
          DateField(
            label: 'Fecha',
            controller: taskController.dateController,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomContainedButton(
            onPressed: onPress,
            text: 'Save',
            fullWidth: true,
            isLoading: taskController.loadingFormButton.value,
          ),
        ],
      ),
    );
  }
}
