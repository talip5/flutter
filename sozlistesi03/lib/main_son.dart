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
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String title = 'Firebase';
  String control='1';
  bool futureButton=true;
  Future<int> getData() async {
    QuerySnapshot querySnapshot =
    await firebaseFirestore.collection('datasoz').get();
    List<QueryDocumentSnapshot> queryDocumentSnapshot = querySnapshot.docs;
    int record = queryDocumentSnapshot.length;
    print(record);
    return record;
  }

  Future<QuerySnapshot> getFuture() async {
    QuerySnapshot querySnapshot =
    await firebaseFirestore.collection('data').get();
    return querySnapshot;
  }

  Future<void> getData1() async {
    QuerySnapshot querySnapshot =
    await firebaseFirestore.collection('data').get();
    //List queryDocumentSnapshot=querySnapshot.docs.toList();
    List queryDocumentSnapshot = querySnapshot.docs;
    int count1 = queryDocumentSnapshot.length;
    print('xxx');
    print(queryDocumentSnapshot.length);
    print(count1);
  }

  void setData2() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection('data').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        firebaseFirestore
            .collection('datasoz')
            .doc(element.id)
            .set({'name': element.get('name'), 'check': element.get('check')});
        print(element.get('name'));
      });
    });
  }

  void deleteData2() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection('data').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        firebaseFirestore.collection('data').doc(element.id).delete();
        print(element.get('name'));
      });
    });
  }

  void deleteAllData3() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection('data').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        firebaseFirestore.collection('data').doc(element.id).delete();
        print(element.get('name'));
      });
    });
  }

  void addAllData() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection('datasoz')
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        firebaseFirestore
            .collection('data')
            .doc(element.id)
            .set({'name': element.get('name'), 'check': element.get('check')});
        print(element.get('name'));
      });
    });
  }

  Future<void> addData3(String id) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection('data')
        .doc(id)
        .set({'name': 'ali', 'check': true});
    print('$id  nolu kayıt eklendi');
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
              FutureBuilder1(),
              ElevatedButton(
                  child: Text(
                    'getData',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  onPressed: () async {
                    int count = await getData();
                    setState(() {
                      title = count.toString();
                    });
                  }),
              ElevatedButton(
                  child: Text(
                    'addData',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  onPressed: () async {
                    addData3('42');
                  }),
              ElevatedButton(
                  child: Text(
                    'addAllData',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  onPressed: () async {
                    await addAllData();
                  }),
              ElevatedButton(
                  child: Text(
                    'deleteAllData',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  onPressed: () async {
                    deleteAllData3();
                  }),
              ElevatedButton(
                child: Text('setdata2', style: TextStyle(fontSize: 25.0)),
                onPressed: () async {
                  int count = await getData();
                  //getData1();
                  //addData3();
                  setData2();
                  //deleteData2();
                  setState(() {
                    //title = count.toString();
                  });
                  print(count);
                },
              ),
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
                    FutureBuilder1();
                  });
                  print('FutureBuilder');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
