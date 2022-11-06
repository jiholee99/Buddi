import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map d = {'Text': "a"};

  Future<String> createEvent(String title, String icon, int capacity, String description, String creationTime) async {
    try {
      await _firestore
          .collection("events")
          .doc()
          .set({"title": title, "icon": icon, "capacity": capacity, "description": description, "creationTime": creationTime});
      return "success";
    } catch (error) {
      return error.toString();
    }
  }
}
