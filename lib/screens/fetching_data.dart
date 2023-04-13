import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helpers/constants.dart';
import '../models/user_model.dart';
import '../services/user_services.dart';
import 'home_screen.dart';

class FetchingData extends StatelessWidget {
  static const String route = '/fetching_data';

  const FetchingData({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: StreamBuilder<UserModel?>(
        stream: UserServices().getUserStream(user!.uid, context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CustomLoader(); // Show a loader until data is fetched
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData) {
            return Text('User not found!');
          }

          return HomeScreen();
        },
      ),
    );
  }
}

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(context).height,
      width: getSize(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            "https://assets1.lottiefiles.com/packages/lf20_n4RinHSVJ4.json",
            height: 100,
          ),
          Text(
            "Fetching your data...",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
