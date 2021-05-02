import 'package:flutter/material.dart';
import 'Sub.dart';


class AddSubDialog1 extends StatefulWidget {
  @override
  _AddSubDialog1State createState() => _AddSubDialog1State();
}

class _AddSubDialog1State extends State<AddSubDialog1> {
  final subToppingTextField = TextEditingController();
  int _sizeSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
          height: 200,
          child: Column(
            children: <Widget>[
              Text(
                'Toppings:',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              TextField(
                controller: subToppingTextField,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              DropdownButton(
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline4,
                  value: _sizeSelected,
                  items: [
                    DropdownMenuItem(child: Text("6 inch"), value: 0),
                    DropdownMenuItem(child: Text("12 inch"), value: 1),
                    DropdownMenuItem(child: Text("18 inch"), value: 2),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _sizeSelected = value;
                    });
                  }),
              ElevatedButton(
                child: Text('Add Sub'),
                onPressed: () {
                  print("Adding a Sub");
                  setState(() {
                    Sub newSub = new Sub(
                        _sizeSelected, subToppingTextField.text);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        )
    );
  }
}