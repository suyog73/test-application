import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.appBarName,
    this.isBack = true,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  final String appBarName;
  final bool isBack;
  final Color backgroundColor, textColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: isBack,
      iconTheme: IconThemeData(color: textColor),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          appBarName,
          style: TextStyle(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
