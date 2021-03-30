import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  Future<QuerySnapshot> getData() async{
    QuerySnapshot querySnapshot=await firebaseFirestore.collection('data').get();
    return querySnapshot;
  }

  Future<QuerySnapshot> getData1() async{
    QuerySnapshot querySnapshot=await firebaseFirestore.collection('data').get();
    return querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder'),
        ),
        body:FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.data==null){
                return CircularProgressIndicator();
              }
              List<QueryDocumentSnapshot> queryDocumentSnapshot=snapshot.data.docs;
              DocumentSnapshot documentSnapshot=snapshot.data.docs.first;
              var name1=documentSnapshot.get('name');
              return ListView.builder(
                  itemCount: queryDocumentSnapshot.length,
                  itemBuilder:(BuildContext context,int index){
                    return Card(
                      child: CheckboxListTile(
                        value: queryDocumentSnapshot[index].get('check'),
                        title:Text(queryDocumentSnapshot[index].get('name'),style: TextStyle(fontSize: 25.0)),
                        onChanged: (bool value1){
                          print(value1);
                        },
                      ),
                    );
                  }
              );
            }
        ),
        //Center(child: Text('Future',style: TextStyle(fontSize: 25.0),)),
      ),
    );
  }
}
