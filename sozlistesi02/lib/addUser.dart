import 'package:cloud_firestore/cloud_firestore.dart';
import 'user.dart';

class AddUser{

  CollectionReference users=FirebaseFirestore.instance.collection('data');

     Future<void> addUser(){
      var isim=User('a1',true);
      return users
          .add({
        'name':name,
        'check':check
        }).then((value) => print('User Added'));
  }

  Future<void> addData() async{
      await users.doc('3').set('name':'ali','check':true);
  }
  }