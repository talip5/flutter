import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FutureBuilder1 extends StatelessWidget {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getData() async {
    QuerySnapshot querySnapshot =
    await firebaseFirestore.collection('datasoz').get();
    return querySnapshot;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          }
          return Expanded(
            child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot =
                  snapshot.data.docs[index];
                  var idNo = documentSnapshot.id;
                  return Text(idNo, style: TextStyle(fontSize: 25.0),);
                }),
          );
        });
  }
}