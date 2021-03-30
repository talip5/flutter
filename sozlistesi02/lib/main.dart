import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'user.dart';
import 'getUser.dart';
import 'delete.dart';
import 'setData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var firebaseApp = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'future';
  List<User> listeUser = [User('ali'), User('veli')];
  List<Check> listeCheck = [Check(true)];
  String text = 'Firebase';

  DeleteUser _deleteUser=DeleteUser();
  SetData _setData=SetData();

  Future<void> addData() async{
    await FirebaseFirestore.instance.collection('data').doc('3').set({'name':'ali','check':true});
    print('kayıt yapıldı');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              FutureBuilder(
                  future: GetUser().getUser(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.connectionState==ConnectionState.done){
                      print('connectinstate=done');
                    }
                    if (snapshot.data == null) {
                      return CircularProgressIndicator();
                    }
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data.docs[index];
                            return ListTile(
                              title: Text(documentSnapshot.get('name')+'  '+documentSnapshot.get('check').toString(),style: TextStyle(fontSize: 25.0),
                              ),
                              onTap: (){
                                setState(() {
                                 String text_id=documentSnapshot.id;
                                 String text_name=documentSnapshot.get('name');
                                 bool text_check=documentSnapshot.get('check');
                                  //addData1(text_id, text_name, text_check);
                                 _deleteUser.deleteUser(text_id);
                                 _setData.setData(text_id, text_name, text_check);
                                });
                                print(documentSnapshot.get('name'));
                              },
                               );
                            //return Text(documentSnapshot.get('name'),style: TextStyle(fontSize: 25.0),);
                          }),
                    );
                  }),
              Text(
                text,
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    //title = listeCheck.length.toString();
                    //title=User('veli').name;
                    //text=listeUser[0].name.toString();
                    //text = listeUser[0].name;
                    //deleteUser('11');
                    addData();
                  });
                },
                child: Text('Delete User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
