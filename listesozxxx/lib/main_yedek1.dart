import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:listesoz/function.dart';
import 'package:listesoz/route.dart';
import 'package:listesoz/sozAlanlar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: FutureBuilder72(),
  ));
}

class FutureBuilder72 extends StatefulWidget {
  @override
  _FutureBuilder82State createState() => _FutureBuilder82State();
}

class _FutureBuilder82State extends State<FutureBuilder72> {

  Function _function = Function();
  Route5 _route5=Route5();

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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          FutureBuilder5(),
          ElevatedButton(
            child: Text('Söz Alanlar'),
            onPressed: (){
              Navigator.push(
                context,
                //MaterialPageRoute(builder: (context) => FutureBuilder),
                MaterialPageRoute(builder: (context) => FutureBuilder45()),
              );
              debugPrint('Liste');
            },
          ),
        ],
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
                  return Card(
                    shadowColor: Colors.blue.withAlpha(90),
                    color: Colors.teal,
                    child: ListTile(
                        title: Text(documentSnapshot.get('name'),
                            style: TextStyle(fontSize: 25.0)),
                        //leading: Icon(Icons.home),
                        leading: CircleAvatar(
                          //backgroundImage:NetworkImage("https://m.economictimes.com/thumb/height-450,width-600,imgsize-571225,msid-75757932/not-just-scientists-students-are-also-fighting-covid-19-.jpg"),
                          backgroundImage: AssetImage("assets/images/ali.jpeg"),
                        ),
                        onTap: () {
                          setState(() {
                            title = documentSnapshot.get('name');
                            FirebaseFirestore firebaseFirestore =
                                FirebaseFirestore.instance;
                            firebaseFirestore
                                .collection('sourceData')
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
                        }),
                  );
                }),
          );
        });
  }
}
