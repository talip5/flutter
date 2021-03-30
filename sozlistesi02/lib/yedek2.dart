import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseApp = await Firebase.initializeApp();
  runApp(AddUser('ahmet35', false));
}

class AddUser extends StatelessWidget{
  final String name;
  final bool check;

  AddUser(this.name,this.check);

  @override
  Widget build(BuildContext context){
    CollectionReference users=FirebaseFirestore.instance.collection('data');

    Future<void> addUser(){
      return users
          .add({
        'name':name,
        'check':check
      }).then((value) => print(value));
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('future'),
        ),
        body: ElevatedButton(
          onPressed: addUser,
          child: Text('Add User'),
        ),
      ),
    );
  }
}

