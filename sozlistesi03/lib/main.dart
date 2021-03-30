import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FutureBuilder2());
}

class FutureBuilder2 extends StatefulWidget {
  @override
  _FutureBuilder2State createState() => _FutureBuilder2State();
}

class _FutureBuilder2State extends State<FutureBuilder2> {

  String control='1';
  bool futureButton=true;
  
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<QuerySnapshot> getFuture() async {
    QuerySnapshot querySnapshot =
    await firebaseFirestore.collection('data').get();
    return querySnapshot;
  }

  Widget FutureBuilder5(){
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder'),
        ),
        body:Column(
          children: [
            FutureBuilder5(),
            ElevatedButton(
              child: Text('FutureBuilder', style: TextStyle(fontSize: 25.0)),
              onPressed: () {
                setState(() {
                  if(futureButton==true){
                    control='0';
                    futureButton=false;
                  }else{
                    control='1';
                    futureButton=true;
                  }
                  FutureBuilder5();
                });
                print('FutureBuilder');
              },
            ),
          ],
        ),
      ),
    );
  }
}


