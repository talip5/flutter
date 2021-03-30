import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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
  Future<QuerySnapshot> getDataList() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot _querySnapshot =
    await firebaseFirestore.collection('data').get();
    return _querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Söz Listesi'),
        ),
        body: Center(
          child: FutureBuilder(
            future: getDataList(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //builder: (context,AsyncSnapshot<DocumentSnapshot> snapshot){
              if (snapshot.hasError) {
                return Text('Evet');
              }
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Center(
                child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot docData = snapshot.data.docs[index];
                      return Card(
                        child: ListTile(
                          title: Text(docData.get('name')+'   '+docData.get('check').toString(),
                              style: TextStyle(fontSize: 25.0)),
                        ),
                      );
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
