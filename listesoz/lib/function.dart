import 'package:cloud_firestore/cloud_firestore.dart';

class Function{
  String name5='ali';

  Future<QuerySnapshot> getFuture() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await firebaseFirestore.collection('tempData').get();
    return querySnapshot;
  }

  Future<void> doldurData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection('sourceData')
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        firebaseFirestore
            .collection('tempData')
            .doc(element.id)
            .set({'name': element.get('name'), 'check': element.get('check')});
        //print(element.get('name'));
        //firebaseFirestore.collection('sourceData').doc(element.id).delete();
      });
    });
  }

  Future<void> bosaltData() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await firebaseFirestore
        .collection('targetData')
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        firebaseFirestore.collection('targetData').doc(element.id).delete();
      });
    });
  }

  }