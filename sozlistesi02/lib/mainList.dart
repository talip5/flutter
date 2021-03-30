import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sozlistesi02/delete.dart';
import 'dart:async';
import 'user.dart';

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
  List<User> listeUser = [User('ali'), User('veli')];
  List<Check> listeCheck=[Check(true)];
  String text='Firebase';
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
              Text(text,style: TextStyle(fontSize: 25.0),),
              SizedBox(height: 30.0,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    //title = listeCheck.length.toString();
                    //title=User('veli').name;
                    //text=listeUser[0].name.toString();
                    text=listeUser[0].name;
                  });
                },
                child: Text('Delete User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
