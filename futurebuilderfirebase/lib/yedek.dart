import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
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

  Future<QuerySnapshot> future1() async{
    FirebaseFirestore firebase=FirebaseFirestore.instance;
    QuerySnapshot querySnapshot=await .collection('data').get();
    print(querySnapshot.docs.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder'),
        ),
        body: FutureBuilder(
          future: future1(),
          //initialData: 'waiting',
          builder: (context, AsyncSnapshot<String> snapshot) {
            var name = snapshot.data;
            if (snapshot.hasError) {
              return Center(
                child: Text('Error :${snapshot.error.toString()}'),
              );
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(child: Text(snapshot.data));
          },
        ),
        //Center(child: Text('FutureBuilder',style: TextStyle(fontSize: 25.0),)),
      ),
    );
    //child: Text('FutureBuilder',style: TextStyle(fontSize: 25.0),),
  }
}
