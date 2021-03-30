import 'package:flutter/material.dart';

class Widgetlar extends StatelessWidget {

 final String baslik;

Widgetlar(this.baslik);

  @override
  Widget build(BuildContext context) {
    return Text(baslik,style: TextStyle(fontSize: 25.0),);
  }
}
