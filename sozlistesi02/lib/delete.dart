import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteUser{

  Future<void> deleteUser(String id) async{
    CollectionReference users=FirebaseFirestore.instance.collection('data');
    return await users.doc(id).delete().then((value) => print('$id nolu dosya silindi'));
  }

 }