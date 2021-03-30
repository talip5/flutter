import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class GetUser1 {

    void getUser1() {
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        firebaseFirestore.collection('data').get().then((QuerySnapshot snapshot) {
            snapshot.docs.forEach((element) {print(element.get('name'));},);
        });
    }

    void getUser2(){
        FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
        firebaseFirestore.collection('data').get().then((QuerySnapshot snapshot){
            snapshot.docs.forEach((element) async {
                print(element.get('name'));
            });
        });
    }
}