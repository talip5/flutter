import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:listesoz/function.dart';
import 'package:listesoz/route.dart';

class FutureBuilder45 extends StatefulWidget {
  @override
  _FutureBuilderState15 createState() => _FutureBuilderState15();
}

class _FutureBuilderState15 extends State<FutureBuilder45> {

  Future<QuerySnapshot> getFuture1() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection('targetData').get();
    return querySnapshot;
  }

  Future<void> delay() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        getFuture1();
        print('delay');
      });
    });
  }

   String title = 'FutureBuilder35';

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: getFuture1(),
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
                          int count = snapshot.data.docs.length;
                          bool value1 = documentSnapshot.get('check');
                          return ListTile(
                            //title: Text(documentSnapshot.get('name')+Text(documentSnapshot.get('date')),
                              title: Text(documentSnapshot.get('name')+'      '+documentSnapshot.get('date'),
                              style: TextStyle(fontSize: 23.0)),
                          );
                        }),
                  );
                }),
          ],
        ),
    );
  }
}
