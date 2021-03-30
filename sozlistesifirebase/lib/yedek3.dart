import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /*void initState(){
  super.initState();
  updateData('kazma');
  }
*/
  Future<QuerySnapshot> getDataList() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot _querySnapshot =
    await firebaseFirestore.collection('data').get();
    return _querySnapshot;
  }

  Future<String> updateData(dynamic isim) async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var isim2=firebaseFirestore.collection('data').doc('1').update({'check':isim});
    print(isim2);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Söz Listesi'),
        ),
        body: Center(
          child: FutureBuilder(
            future: getDataList(),
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
                      //return ListTile(title: Text(docData.get('name')),);
                      return Card(
                        child: CheckboxListTile(
                          title: Text(docData.get('name')),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: docData.get('check'),
                          onChanged:(bool value){
                            setState(() {
                              value=value;
                            });
                          },
                          activeColor: Colors.green,
                          checkColor: Colors.black,
                        ),
                      );
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
