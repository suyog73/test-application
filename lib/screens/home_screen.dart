import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/constants.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../services/auth_services.dart';
import '../widgets/button_widget.dart';
import 'auth_screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? userModel =
        Provider.of<UserProvider>(context, listen: false).currentUser;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (userModel != null) ...[
              Text(userModel.uid.toString()),
              Text(userModel.name.toString()),
              Text(userModel.imageUrl.toString()),
              Text(userModel.email.toString()),
            ],
            SizedBox(height: 15),
            ButtonWidget(
              text: "Logout",
              textColor: secondaryColor,
              onTap: () async {
                await AuthServices().signOut(context: context);
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.route, (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
