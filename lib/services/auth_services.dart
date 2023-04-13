import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

  // SignUp Method
  Future signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Register successfully');

      return null;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    }
  }

  //SignIn method
  Future signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print('Login successfully');

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SignOut Method
  Future signOut({required BuildContext context, bool isAdmin = false}) async {
    await _auth.signOut().then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'Logout Successfully',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }

  Future verifyEmail({required context, required bool isAdmin}) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'Verification email has been sent',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

//Store Token
  Future<void> storeToken({token, bool isAdmin = false}) async {
    final CollectionReference userCollection =
        FirebaseFirestore.instance.collection("users");

    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();

    userCollection
        .doc(uid)
        .set({"token": token}, SetOptions(merge: true))
        .then((value) => print("User Token Updated"))
        .catchError((error) => print("Failed to Update Token: $error"));

    return;
  }
}
