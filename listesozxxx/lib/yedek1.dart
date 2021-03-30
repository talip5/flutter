import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:listesoz/function.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FutureBuilder2());
}

class FutureBuilder2 extends StatefulWidget {
  @override
  _FutureBuilder2State createState() => _FutureBuilder2State();
}

class _FutureBuilder2State extends State<FutureBuilder2> {
  Function _function = Function();

  Future<void> delay() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        _function.getFuture();
        FutureBuilder5();
        print('delay');
      });
    });
  }

  @override
  void initState() {
    var name = _function.name5;
    super.initState();
    print('initState');
    delay();
  }

  String title = 'FutureBuilder35';

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            FutureBuilder5(),
          ],
        ),
      ),
    );
  }

  Widget FutureBuilder5() {
    return FutureBuilder(
        future: _function.getFuture(),
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
                  DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                  int count = snapshot.data.docs.length;
                  bool value1 = documentSnapshot.get('check');
                  return CheckboxListTile(
                      title: Text(documentSnapshot.get('name'),
                          style: TextStyle(fontSize: 25.0)),
                      value: value1,
                      onChanged: (bool valueChecked) {
                        setState(() {
                          title = documentSnapshot.get('name');
                          FirebaseFirestore firebaseFirestore =
                              FirebaseFirestore.instance;
                          firebaseFirestore
                              .collection('data2')
                              .doc(documentSnapshot.id)
                              .set({
                            'name': documentSnapshot.get('name'),
                            'check': documentSnapshot.get('check')
                          });
                          firebaseFirestore
                              .collection('data')
                              .doc(documentSnapshot.id)
                              .delete()
                              .then((_) {
                            //print(documentSnapshot.get('name'));
                          });

                          if (count == 1) {
                            _function.doldurData();
                            delay();
                            print('izmir3545');
                          }
                        });
                      });
                }),
          );
        });
  }
}
