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

     class MyApp extends StatelessWidget {
        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
          return MaterialApp(
          title: 'FireStore Demo List',
          theme: ThemeData(
          primarySwatch: Colors.blue,
            ),
            home: FirebaseDemo(),
               );
            }
         }

     class FirebaseDemo extends StatefulWidget {
      @override
        _FirebaseDemoState createState() => _FirebaseDemoState();
     }

    class _FirebaseDemoState extends State<FirebaseDemo> {
      final TextEditingController _newItemTextField = TextEditingController();
        final CollectionReference itemCollectionDB = FirebaseFirestore.instance.collection('ITEMS');
      List<String> itemList = [];

    Widget nameTextFieldWidget() {
      return SizedBox(
        width: MediaQuery.of(context).size.width / 1.7,
        child: TextField(
        controller: _newItemTextField,
        style: TextStyle(fontSize: 22, color: Colors.black),
        decoration: InputDecoration(
        hintText: "Item Name",
        hintStyle: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
        );
      }

   Widget addButtonWidget() {
      return SizedBox(
      child: ElevatedButton(
        onPressed: () async {
          //setState(() {
          //itemList.add(_newItemTextField.text);
          //_newItemTextField.clear();
        await itemCollectionDB.add({'item_name': _newItemTextField.text}).then((value) => _newItemTextField.clear());
          //});
            },
        child: Text(
        'Add Data',
        style: TextStyle(fontSize: 20),
              )),
          );
      }

  Widget itemInputWidget() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          nameTextFieldWidget(),
            SizedBox(width: 10,),
            addButtonWidget(),
                ],
            );
          }

  Widget itemTileWidget(snapshot, position) {
    return ListTile(
      leading: Icon(Icons.check_box),
      title: Text(snapshot.data.docs[position]['item_name']),
        onTap: () {
          setState(() {
              print("You tapped at postion =  $position");
              String itemId = snapshot.data.docs[position].id;
              itemCollectionDB.doc(itemId).delete();
                  });
              },
          );
      }

  Widget itemListWidget() {
      itemCollectionDB = FirebaseFirestore.instance.collection('USERS').doc(userID).collection('ITEMS');
      return Expanded(
      child:
      StreamBuilder(stream: itemCollectionDB.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      return ListView.builder(
        itemCount: snapshot.data.docs.length,
          itemBuilder: (BuildContext context, int position) {
          return Card(
          child: itemTileWidget(snapshot,position)
                               );
                            }
                      );
                  })
            );
    }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            itemInputWidget(),
              SizedBox(height: 40,),
                itemListWidget(),
                            ],
                          ),
                    ),
                );
            }
        }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if(snapshot.hasData) {
          print("data exists");
          userID = FirebaseAuth.instance.currentUser.uid;
        return mainScreen();
      }
      else {
        return loginScreen();
            }
        },
      );


}
