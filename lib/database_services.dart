import 'dart:ffi';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class DataBaseServices {
  static Future<void> addData(String title, String detail) async {
    _firebaseFirestore.collection('notes').add({
      "title": title,
      "detail": detail,
    }).whenComplete(() => print("Add Success")).catchError((e) {
      print(e.toString());
    });
  }
}