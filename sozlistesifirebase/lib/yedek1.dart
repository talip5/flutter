import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<QuerySnapshot> getDataList() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot _querySnapshot = await firebaseFirestore.collection('data')
        .get();
    return _querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Söz Listesi'),
      ),
      body: FutureBuilder(
          future: getDataList(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView.builder(
                itemCount:snapshot.data.docs.length,
                itemBuilder: (context,index) {
                  DocumentSnapshot dataList=snapshot.data.docs[index];
                  if (snapshot.hasError) {
                    return Text('Evet');
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Text(dataList.get('titlex')
                  );
                }
            );
          }
      ),
    );
  }
}

