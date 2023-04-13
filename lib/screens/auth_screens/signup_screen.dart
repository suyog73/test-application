import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../../helpers/validators.dart';
import '../../models/user_model.dart';
import '../../services/auth_services.dart';
import '../../services/user_services.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../fetching_data.dart';

class SignUpScreen extends StatelessWidget {
  static const String route = '/signup_screen';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBarWidget(
        appBarName: "Signup",
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
                  .signUp(
                email: emailController.text,
                password: passwordController.text,
              )
                  .then((value) async {
                User? user = FirebaseAuth.instance.currentUser;

                UserModel userModel = UserModel(
                  name: user!.displayName ?? "Suyog",
                  email: emailController.text,
                  imageUrl: user.photoURL ??
                      "https://buffer.com/cdn-cgi/image/w=7000,fit=contain,q=90,f=auto/library/content/images/size/w600/2020/05/Frame-9.png",
                  uid: user.uid,
                );

                return (value == null)
                    ? await UserServices().addUser(userModel).then((value) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          FetchingData.route,
                          (route) => false,
                        );
                      })
                    : null;
              });
            },
            text: "Signup",
            textColor: secondaryColor,
          ),
        ],
      ),
    );
  }
}
