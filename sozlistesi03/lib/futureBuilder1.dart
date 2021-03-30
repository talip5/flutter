import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class FutureBuilder1 extends StatefulWidget {
  @override
  _FutureBuilder1State createState() => _FutureBuilder1State();
}

class _FutureBuilder1State extends State<FutureBuilder1> {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String control='1';
  Future<QuerySnapshot> getFuture() async {
    QuerySnapshot querySnapshot =
    await firebaseFirestore.collection('data').get();
    return querySnapshot;
  }

  Widget FutureBuilder1(){
    if(control=='1'){
      return Text('FutureBuilder',
          style: TextStyle(fontSize: 25.0));
    }else{
      return FutureBuilder(
        future: getFuture(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print('connectinstate=done');
          }
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          }
          return Expanded(
            child: ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot =
                  snapshot.data.docs[index];
                  return ListTile(
                    title: Text(documentSnapshot.get('name'),
                        style: TextStyle(fontSize: 25.0)),
                  );
                }),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder1();
  }
}


