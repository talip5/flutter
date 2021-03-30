import 'package:flutter/material.dart';

class Route5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Route'),
        ),
        body: ElevatedButton(
          child: Text('Ana Sayfa'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}


