import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../providers/user_provider.dart';

class UserServices {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  // It is returning list of all users
  Stream<List<UserModel>> getUsers() {
    return _userCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  // Current user stream
  Stream<UserModel?> getUserStream(String uid, BuildContext context) {
    return _userCollection.doc(uid).snapshots().map((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        Provider.of<UserProvider>(context, listen: false)
            .setUser(UserModel.fromJson(data));

        return UserModel.fromJson(data);
      }
      return null;
    });
  }

  // Current user future
  Future<UserModel?> getUser(String uid) async {
    try {
      final snapshot = await _userCollection.doc(uid).get();
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        return UserModel.fromJson(data);
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Adding new user signup
  Future<void> addUser(UserModel userModel) async {
    try {
      await _userCollection.doc(userModel.uid).set(userModel.toJson());
      print('user added successfully');
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  
  Future<void> updateUserProperty(
      String uid, String propertyName, dynamic value) async {
    try {
      await _userCollection.doc(uid).set(
        {
          propertyName: value,
        },
        SetOptions(merge: true),
      );
      print('user updated successfully');
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  Future<void> deleteAllUsers() async {
    final instance = FirebaseFirestore.instance;
    final batch = instance.batch();
    CollectionReference collection = _userCollection;
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }
}
