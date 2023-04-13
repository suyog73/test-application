import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<void> getToken(
    {required String msg,
    required String receiverUid,
    required BuildContext context}) async {
  User? user = FirebaseAuth.instance.currentUser;
  String uid = user!.uid;

  var notificationReceiver = await FirebaseFirestore.instance
      .collection("users")
      .doc(receiverUid)
      .get();

  var doc1 =
      await FirebaseFirestore.instance.collection("users").doc(uid).get();

  bool docStatus = notificationReceiver.exists;
  bool docStatus1 = doc1.exists;

  if (docStatus == true && docStatus1 == true) {
    callOnFcmApiSendPushNotifications(
        [notificationReceiver['token']], msg, "userModel.name.toString()");
    // sender token, description, title

  }
}

callOnFcmApiSendPushNotifications(
    List<String> userToken, String msg, String name) async {
  // print("Notification : ${userToken[0]} $msg - $name");

  const postUrl = 'https://fcm.googleapis.com/fcm/send';
  final data = {
    "registration_ids": userToken,
    "collapse_key": "type_a",
    "notification": {
      "title": name,
      "body": msg,
    }
  };

  final headers = {
    'content-type': 'application/json',
    'Authorization': 'Bearer 	${dotenv.env['FIREBASENOTIFICATION']}'
  };

  try {
    final response = await http.post(Uri.parse(postUrl),
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      // on success do sth
      // print('test ok push CFM');
      return true;
    } else {
      // print(' CFM error${response.reasonPhrase}');
      // on failure do sth
      return false;
    }
  } catch (e) {
    // print('exception$e');
  }
}
