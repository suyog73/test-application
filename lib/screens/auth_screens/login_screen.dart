import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../../helpers/validators.dart';
import '../../services/auth_services.dart';
import '../../services/user_services.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../fetching_data.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String route = '/login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBarWidget(
        appBarName: "Login",
        backgroundColor: primaryColor,
        textColor: secondaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(
            hintText: "Email",
            icon: Icons.email,
            controller: emailController,
            validator: emailValidator,
            textInputType: TextInputType.emailAddress,
            iconColor: primaryColor,
            textColor: primaryColor,
          ),
          TextFieldWidget(
            hintText: "Password",
            icon: Icons.password,
            controller: passwordController,
            validator: passwordValidator,
            textInputType: TextInputType.visiblePassword,
            iconColor: primaryColor,
            textColor: primaryColor,
          ),
          SizedBox(height: 10),
          ButtonWidget(
            onTap: () async {
              await AuthServices()
                  .signIn(
                email: emailController.text,
                password: passwordController.text,
              )
                  .then((value) async {
                return (value == null)
                    ? Navigator.pushNamedAndRemoveUntil(
                        context,
                        FetchingData.route,
                        (route) => false,
                      )
                    : null;
              });
            },
            text: "Login",
            textColor: secondaryColor,
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, SignUpScreen.route, (route) => false);
            },
            child: Text("Signup"),
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () async {
              await UserServices().deleteAllUsers();
            },
            child: Text("Delete"),
          ),
        ],
      ),
    );
  }
}
