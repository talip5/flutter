import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUser{
  FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Future getUser() async{
    QuerySnapshot querySnapshot=await _firestore.collection('data').get();
    return querySnapshot;
  }
}