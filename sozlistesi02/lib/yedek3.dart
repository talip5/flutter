import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'addUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseApp = await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  AddUser _addUser=AddUser('Ayşe3535',false);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('future'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed:(){
              _addUser.addUser();
              print(_addUser.name);
            },
            child: Text('Add User'),
          ),
        ),
      ),
    );
  }
}


