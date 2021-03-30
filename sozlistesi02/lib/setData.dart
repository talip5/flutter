import 'package:cloud_firestore/cloud_firestore.dart';

class SetData{

  Future<void> setData(String textId,String textName,bool textCheck) async{
    await FirebaseFirestore.instance.collection('datasoz').doc(textId).set({'name':textName,'check':textCheck});
    print('kayıt yapıldı');
  }

}