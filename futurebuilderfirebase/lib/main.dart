import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(futurebuilderfirebase());
  print('futurebuilder');
}

Future<String> future1() async {
  await Future.delayed(Duration(seconds: 5), () {
    print('time 5 sn');
  });
  return await 'deneme7';
}

// ignore: camel_case_types
class futurebuilderfirebase extends StatefulWidget {
  @override
  _futurebuilderfirebaseState createState() => _futurebuilderfirebaseState();
}

class _futurebuilderfirebaseState extends State<futurebuilderfirebase> {
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  // ignore: must_call_super
  void dispose() {
    print('dispose');
    super.dispose();
  }

  Future<QuerySnapshot> future1() async {
    FirebaseFirestore firebase = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firebase.collection('data').get();
    print(querySnapshot.docs.length);
    return querySnapshot;
  }

  Future<DocumentSnapshot> future2() async {
    FirebaseFirestore firebase = FirebaseFirestore.instance;
    DocumentSnapshot documentSnapshot =
        await firebase.collection('data').doc('10').get();
    print(documentSnapshot.id);
    return documentSnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder'),
        ),
        body: Center(
          child: FutureBuilder(
            future: future1(),
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
                      //return Text(snapshot.data.docs[index].id.toString(),style: TextStyle(fontSize: 25.0));
                      //return Text(snapshot.data.docs[index].id.toString(),style: TextStyle(fontSize: 25.0));
                      return Card(
                        child: ListTile(
                          title: Text(docData.get('name')),
                        ),
                      );
                    }),
                /*child: Text(
                snapshot.data.docs.length.toString(),
                style: TextStyle(fontSize: 25.0),
              ),*/
              );
              //child: Text(snapshot.data.get('name'),style: TextStyle(fontSize: 25.0),));
            },
          ),
        ),
        //Center(child: Text('FutureBuilder',style: TextStyle(fontSize: 25.0),)),
      ),
    );
    //child: Text('FutureBuilder',style: TextStyle(fontSize: 25.0),),
  }
}
