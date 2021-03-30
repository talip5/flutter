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

  /*Future updateDate(String docId) async{
   await firebaseFirestore.collection('data').doc(docId).update({'name':'koyun3535'});
  }*/

  /*Future updateDate() async{
    await firebaseFirestore.collection('data').doc('1').update({'check':'koyun1'});
  }*/

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
                        return CheckboxListTile(
                            value: documentSnapshot.get('check'),
                            title: Text(documentSnapshot.get('name')),
                            onChanged: (bool value) {
                              setState(() {
                                value = value;
                                int deger = index + 1;
                                firebaseFirestore
                                    .collection('data')
                                    .doc('$deger')
                                    .update({'check': value});
                              });
                            });
                      });
                })));
  }
}
