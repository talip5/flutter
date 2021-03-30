import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

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

  @override
  void initState(){
    super.initState();
    doldurData();
    print('initState');
  }
  bool kayit=false;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getFuture() async {
    QuerySnapshot querySnapshot =
    await firebaseFirestore.collection('data').get();
    return querySnapshot;
  }

  Future<void> doldurData() async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore.collection('data2').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        firebaseFirestore.collection('data').doc(element.id).set(
            {'name': element.get('name'), 'check': element.get('check')});
        print(element.get('name'));
        firebaseFirestore.collection('data2').doc(element.id).delete();
      });
    });
  }

  void setData2() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection('data').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        kayit = element.get('check');
        if (kayit == true) {
          firebaseFirestore.collection('data2').doc(element.id).set(
              {'name': element.get('name'), 'check': element.get('check')});
          print(element.get('name'));
          firebaseFirestore.collection('data').doc(element.id).delete();
        }
      });
    });
  }

  void setData() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection('data1')
        .doc('52')
        .set({'name': 'ali', 'check': true});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder'),
        ),
        body: Column(
          children: [
            FutureBuilder5(),
            ElevatedButton(
              child: Text('FutureBuilder', style: TextStyle(fontSize: 25.0)),
              onPressed: () {
                setData2();
                print('kayıt yapıldı');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget FutureBuilder5() {
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
                  DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                  int count=snapshot.data.docs.length;
                  bool value1 = documentSnapshot.get('check');
                  return CheckboxListTile(
                      title: Text(documentSnapshot.get('name'),
                          style: TextStyle(fontSize: 25.0)),
                      value: value1,
                      onChanged: (bool valueChecked) {
                        setState(() {
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
                              .delete().then((_){
                            print(documentSnapshot.get('name'));
                          });

                          if(documentSnapshot.get('name')=='izmir') {
                            setState(() {
                              doldurData();
                              FutureBuilder5();
                              print('izmir35');
                            });
                          }
                        });
                      });
                }),
          );
        });
  }
}
