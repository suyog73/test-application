
import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.validator,
    this.textInputAction = TextInputAction.next,
    required this.textInputType,
    required this.iconColor,
    required this.textColor,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Color iconColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: Stack(
        children: [
          Container(
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey.shade100,
              border: Border.all(
                color: textColor.withOpacity(0.5),
              ),
            ),
          ),
          TextFormField(
            style: TextStyle(color: textColor, fontSize: 16),
            decoration: kTextFormFieldAuthDec.copyWith(
              hintText: hintText,
              prefixIcon: Icon(icon, color: iconColor),
              errorStyle: TextStyle(color: Colors.red),
            ),
            keyboardType: textInputType,
            textInputAction: textInputAction,
            cursorColor: iconColor,
            controller: controller,
            onSaved: (value) {
              controller.value = controller.value.copyWith(text: value);
            },
            validator: validator,
          ),
        ],
      ),
    );
  }
}
