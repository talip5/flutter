import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              child: Text('Detail Page',style: TextStyle(fontSize: 25.0),),
              onPressed: (){
                Navigator.pushNamed(context, "/detail");
              },
            ),
            ElevatedButton(
              child: Text('Setting Page',style: TextStyle(fontSize: 25.0),),
              onPressed: (){
                Navigator.pushNamed(context, "/setting");
              },
            ),
            ElevatedButton(
              child: Text('Dosya İşlemleri',style: TextStyle(fontSize: 25.0),),
              onPressed: (){
                Navigator.pushNamed(context, "/dosyaislemleri");
              },
            ),

            ElevatedButton(
              child: Text('Basit json',style: TextStyle(fontSize: 25.0),),
              onPressed: (){
                Navigator.pushNamed(context, "/jsonKonusu");
              },
            ),
            ElevatedButton(
              child: Text('jsonMain',style: TextStyle(fontSize: 25.0),),
              onPressed: (){
                Navigator.pushNamed(context, "/jsonMain");
              },
            ),
          ],
        ),
      ),
    );
  }
}
