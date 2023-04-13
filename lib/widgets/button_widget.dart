import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    this.borderRadius = 5,
    this.borderColor = primaryColor,
    this.textColor = primaryColor,
    this.width,
    this.height = 54,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final double borderRadius;
  final double? width, height;
  final Color borderColor, textColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width ?? size.width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: borderColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
