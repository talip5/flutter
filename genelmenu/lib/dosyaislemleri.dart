import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class kayitislemleri{
  Future<String> get dosyayolu async{
    final konum=await getApplicationDocumentsDirectory();
    return konum.path;
  }

  Future<File> get yerelDosya async{
    final yol=await dosyayolu;
    return File("$yol/yenidosya.txt");
  }

  Future<String> dosyaOku() async{
    try{
      final dosya=await yerelDosya;
      String icerik=await dosya.readAsString();
      return icerik;
    }catch(h){
    return "Dosya okurken hata oluştu";
    }
  }

  Future<File> dosyaYaz(String gIcerik) async{
    final dosya=await yerelDosya;
    return dosya.writeAsString("$gIcerik");
  }
}

class Dosyaislemleri extends StatefulWidget{
  final kayitislemleri kayitislemi;
  const Dosyaislemleri({Key key, this.kayitislemi}) : super(key: key);
  @override
  State<StatefulWidget> createState()=> DosyaState();
}

class DosyaState extends State<Dosyaislemleri> {
  final yaziCtrl=TextEditingController();
  String veri="";

  Future<File> veriKaydet() async{
    setState(() {
      veri=yaziCtrl.text;
    });
    return widget.kayitislemi.dosyaYaz(veri);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*widget.kayitislemi.dosyaOku().then((String deger){
      setState(() {
        veri=deger;
      });
    });*/
  }

  void veriOku(){
    widget.kayitislemi.dosyaOku().then((String deger){
      setState(() {
        veri=deger;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dosya işlemleri'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Dosyaya yazmak istediklerinizi yazınız",
            ),
            controller: yaziCtrl,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child:Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      child: Text("Kaydet"),
                      onPressed: veriKaydet,
                    ),
                  ),
              ),Expanded(
                  child:Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      child: Text("Oku"),
                      onPressed: veriOku,
                    ),
                  ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("$veri"),
            ),
          ),
        ],
      ),
    );
  }
}