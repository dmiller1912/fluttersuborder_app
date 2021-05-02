import 'package:flutter/material.dart';
import 'Sub.dart';
import 'add_Sub.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIS 3334 Sub',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sub App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
List<Sub> subsInOrder = [];

class _MyHomePageState extends State<MyHomePage> {


  void _addSub() {

    showDialog(
        context: context,
        builder: (context) {
          return AddSubDialog1();
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: subsInOrder.length,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              child: ListTile(
                leading: Icon(Icons.restaurant),
                title: Text(subsInOrder[position].description),
                onTap: () {
                  print("You tapped on items $position");
                },

              )
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addSub,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


