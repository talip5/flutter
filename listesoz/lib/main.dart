import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:listesoz/function.dart';
import 'package:listesoz/route.dart';
import 'package:listesoz/sozAlanlar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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
/*
 static final DateTime addNow=(DateTime.now().add(Duration(hours: 3)));
  var formattedDate1=DateFormat.yMMMEd('tr_TR').format(addNow);
  var formattedDate2=DateFormat.Hms('tr_TR').format(addNow);*/

  void zaman(){
      DateTime now=DateTime.now();
      final DateTime addNow=(DateTime.now().add(Duration(hours: 3)));
      var formattedDate1=DateFormat.yMMMEd('tr_TR').format(addNow);
      var formattedDate2=DateFormat.Hms('tr_TR').format(addNow);
      title='$formattedDate1   $formattedDate2';
      print(title);
  }

   /*DateTime now=DateTime.now();
  static final DateTime addNow=(DateTime.now().add(Duration(hours: 3)));
  String formattedDate=DateFormat('yyyy-MM-dd - kk:mm').format(addNow);*/
  //String formattedDate=DateFormat('kk:mm:ss \n EEE d MMM').format();

  String title='DateTime';

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
    //delay();
  }

   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr_TR');
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        //title: Text(DateFormat.yMMMd('tr_TR').format(DateTime.now())+'  '+DateFormat.Hms('tr_TR').format(DateTime.now())),
        //title: Text('${now.hour}:${now.minute}:${now.second}'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: (){
                zaman();
              },
              child:Text('Date-Time')
          ),
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
                            zaman();
                             FirebaseFirestore firebaseFirestore =
                                FirebaseFirestore.instance;
                            firebaseFirestore
                                .collection('targetData')
                                .doc(documentSnapshot.id)
                                .set({
                              'name': documentSnapshot.get('name'),
                              'check': documentSnapshot.get('check'),
                             'date': title,
                            });
                            firebaseFirestore
                                .collection('tempData')
                                .doc(documentSnapshot.id)
                                .delete()
                                .then((_) {
                              //print(documentSnapshot.get('name'));
                            });

                            if (count == 1) {
                              _function.doldurData();
                              _function.bosaltData();
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

