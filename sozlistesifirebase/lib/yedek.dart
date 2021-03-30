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

  String check = 'true';
  String title= 'titlex';
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future getDataList() async {
    QuerySnapshot _querySnapshot =await firebaseFirestore.collection('data').get();
    int count=_querySnapshot.docs.length;
    setState(() {
      title=count.toString();
    });
  }
  Future<QuerySnapshot> getData(int record) async {
    QuerySnapshot querySnapshot = await firebaseFirestore.collection('data')
        .get();
    DocumentSnapshot documentSnapshot = querySnapshot.docs.elementAt(record);
    //DocumentSnapshot documentSnapshot = querySnapshot.docs.last;
    //String isim=documentSnapshot.get('titlex').toString();
    var isim = documentSnapshot.get('titlex');
    setState(() {
      check=isim;
    });
    print(isim);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Söz Listesi'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Text(check,style: TextStyle(fontSize: 25.0)
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                child: Text('Future35'),
                onPressed:(){
                  getData(0);
                }
            ),
            SizedBox(height: 20.0),
            Text(title,style: TextStyle(fontSize: 25.0)
            ),
            ElevatedButton(
                child: Text('list'),
                onPressed:(){
                  getDataList();
                }
            ),
            /*RaisedButton(
              child: Text('Future'),
              color: Colors.green,
              onPressed: getData,
            ),*/
          ],
        ),
        //(child: Text(is,style: TextStyle(fontSize: 25.0),)),
      ),
    );
  }
}

