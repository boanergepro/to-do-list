import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/src/core/utils/date_extension.dart';
import 'package:to_do_list/src/core/utils/string_extension.dart';

class DateField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const DateField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 4.0,
              bottom: 4.0,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: Colors.white,
            ),
            child: TextField(
              //onChanged: controller.onChangeInput,
              controller: controller,
              decoration: InputDecoration(
                label: Text(
                  label,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              DateTime? date = await showDatePicker(
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        onPrimary: Colors.white,
                        surface: Colors.white,
                        onSurface: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
                locale: const Locale('es', 'ES'),
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                currentDate: DateTime.now(),
                initialDate: controller.text.toDateTime(),
                helpText: 'Selecciona la fecha',
                cancelText: 'Cancelar',
                confirmText: 'Aceptar',
                initialEntryMode: DatePickerEntryMode.calendarOnly,
              );
              if (date != null) {
                controller.text = date.toIsoString();
              }
            },
            child: Container(
              height: 70,
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 4.0,
                bottom: 4.0,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.transparent,
              ),
              child: SizedBox(
                width: Get.width,
              ),
            ),
          )
        ],
      ),
    );
  }
}
