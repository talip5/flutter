import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class AddUser{

  final String name;
  final bool check;

  AddUser(this.name,this.check);

  CollectionReference users=FirebaseFirestore.instance.collection('data');

  Future<void> addUser(){
    return users
        .add({
      'name':name,
      'check':check
    }).then((value) => print('User Added'));
  }

  Future<void> deleteUser(){

    return users.doc('2').delete().then((value) => print('1 nolu dosya silindi'));
  }

  Future<void> updateUser(){
    return users.doc('3').update({'name':'ankara'}).then((value) => print('update'));
  }

  Future getUser() async {
    //CollectionReference users=FirebaseFirestore.instance.collection('data').doc('3').
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    DocumentSnapshot documentSnapshot=await firebaseFirestore.collection('data').doc('3').get();

    return documentSnapshot.get('name');
  }

}