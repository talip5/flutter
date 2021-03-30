import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'addUser.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseApp = await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  AddUser _addUser=AddUser('izmir',true);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('future'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed:(){
                  _addUser.addUser();
                  print(_addUser.name);
                },
                child: Text('Add User'),
              ),

              ElevatedButton(
                onPressed:(){
                  _addUser.deleteUser();
                  print('silindi');
                },
                child: Text('Delete User'),
              ),
              ElevatedButton(
                onPressed:(){
                  _addUser.updateUser();
                  print('silindi');
                },
                child: Text('Update User'),
              ),
              ElevatedButton(
                onPressed:() async {
                  var name5=await _addUser.getUser();
                  print(name5);
                },
                child: Text('get User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


