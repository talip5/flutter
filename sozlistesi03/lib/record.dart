import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Record {

  Future<void> setData(String docId) async {

    await FirebaseFirestore.instance
        .collection('data')
        .doc(docId)
        .set({'name': 'kemal', 'check': false});
  }
}
