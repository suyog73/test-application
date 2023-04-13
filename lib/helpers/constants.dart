import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String appName = "AppName";
const String appLogo = "assets/images/Logo.png";

const Color primaryColor = Color(0xff000000);
const Color secondaryColor = Color(0xffffffff);

String kHeroProfile = "TagForProfilePicture";
String mapApiKey = dotenv.env["MAPS_API_KEY"].toString();

Size getSize(BuildContext context) => MediaQuery.of(context).size;

double kPadding = 18;

var kPhoneInputDec = InputDecoration(
  contentPadding: EdgeInsets.only(top: 18, bottom: 18),
  hintText: "Phone Number",
  border: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor),
    borderRadius: BorderRadius.circular(5),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor),
    borderRadius: BorderRadius.circular(5),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor),
    borderRadius: BorderRadius.circular(5),
  ),
);

var kTextFormFieldAuthDec = InputDecoration(
  contentPadding: EdgeInsets.only(top: 18, bottom: 18),
  hintStyle: TextStyle(color: Colors.grey.shade700),
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  errorStyle: TextStyle(color: Colors.redAccent),
);

var kInputDecoration = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: primaryColor),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: primaryColor),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: primaryColor),
  ),
);
