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
  String future = 'Future';
  String title = 'Future35';
  int number = 0;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getData() async {
    QuerySnapshot querySnapshot =
    await firebaseFirestore.collection('data').get();
    return querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.data == null) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    itemCount:snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                      snapshot.data.docs[index];
                      return Text(documentSnapshot.get('name'));
                    },
                  );
                })));
  }
}
