import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String future='Future';
  String title='Future35';
  int number=0;
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  Future getData() async{
    QuerySnapshot querySnapshot=await firebaseFirestore.collection('data').get();
    DocumentSnapshot documentSnapshot=await querySnapshot.docs[1];
    print(documentSnapshot.get('name'));
    title=documentSnapshot.get('name');
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body:ElevatedButton(
          child: Text('Future'),
          onPressed:() async{
            await getData();
            setState(() {
              title;
            });
          },
        ),
        /*Center(
          child: Text(getData().toString(),style: TextStyle(fontSize: 25.0),),
        ),*/
      ),
    );
  }
}
