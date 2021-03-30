import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'addUser.dart';
import 'getUser1.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseApp = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'future';

  AddUser _addUser = AddUser('izmir', true);

  AddUser1 _addUser1 = AddUser1();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _addUser.addUser();
                  print(_addUser.name);
                },
                child: Text('Add User'),
              ),
              ElevatedButton(
                onPressed: () {
                  _addUser.deleteUser();
                  print('silindi');
                },
                child: Text('Delete User'),
              ),
              ElevatedButton(
                onPressed: () {
                  _addUser.updateUser();
                  print('silindi');
                },
                child: Text('Update User'),
              ),
              ElevatedButton(
                onPressed: () async {
                  var name5 = await _addUser.getUser();
                  print(name5);
                },
                child: Text('get User'),
              ),
              ElevatedButton(
                onPressed: () {
                  _addUser1.getUser2();
                },
                child: Text('get User1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
