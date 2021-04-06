import 'package:flutter/material.dart';
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Tutorial',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter TextField Clear and Set Value'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = new TextEditingController();
  String baslik="başlık";
  String x5="";
  int x=0;
  int carpma=0;
  int value5=0;
  final key=GlobalKey();
  final key2=GlobalKey();
  void artis_fonk(){
    x++;
    carpma=x*10;
  }
  void kontrol(value5){
    if(value5==50){
      print("beş");
    }
    else{
      print("değer yok");
    }
  }

  @override
  Widget build(BuildContext context) {
    _textController.text = 'Hello Flutter35'; //Set value
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body:Column(children: [
        Text(carpma.toString(),style: TextStyle(fontSize: 20),),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  key: key,
                  margin: const EdgeInsets.all(5.0),
                  color: Colors.amber[600],
                  width: 48.0,
                  height: 48.0,
                ),
              ),
              Expanded(
                child: Container(
                  key: key2,
                  margin: const EdgeInsets.all(5.0),
                  color: Colors.amber[600],
                  width: 48.0,
                  height: 48.0,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  color: Colors.amber[600],
                  width: 48.0,
                  height: 48.0,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  color: Colors.amber[600],
                  width: 48.0,
                  height: 48.0,
                ),
              ),
            ],
          ),

        Center(child:TextField(
          controller: _textController,
         autofocus: true,
          onChanged: (String value){
            print(value);
            _textController.text=value;
            print(_textController);
          },
          onTap: (){
            print("ccc");
            _textController.text="";
          },
          decoration: InputDecoration(
              hintText: "Username",
              ),
        )),
          Text(baslik,style: TextStyle(fontSize: 20),),
          RaisedButton(
            onPressed: () {
              setState(() {
                kontrol(5);
              });
            },
            child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 10),
          RaisedButton(
            onPressed: () {
              setState(() {
                artis_fonk();
              });
            },
            child: Text('Artış', style: TextStyle(fontSize: 20)),
          ),
          Text(x.toString(),style: TextStyle(fontSize: 20),),
        ],)
    );
  }
}