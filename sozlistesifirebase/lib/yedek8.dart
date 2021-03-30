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
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                        snapshot.data.docs[index];
                        var idNo=documentSnapshot.id;
                        return Card(
                          child: Transform.scale(
                            scale: 1.2,
                            child: CheckboxListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                                value: documentSnapshot.get('check'),
                                title: Text(documentSnapshot.get('name'),style: TextStyle(fontSize: 25.0),),
                                onChanged: (bool value1) async{
                                  print('idNo : $idNo');
                                  print(value1);
                                  setState(() {
                                    firebaseFirestore
                                        .collection('data')
                                        .doc(idNo)
                                        .update({'check': value1});
                                  });
                                }),
                          ),
                        );
                      });
                })));
  }
}
