


import 'package:date_otk_flutter/models/button_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ButtomBox extends StatelessWidget{
  ButtomBox({@required this.data, @required this.onPressed});

  final ButtonOptions data;
  final VoidCallback onPressed;

  Color buttomColor = Colors.black54;
  Color borderColor = Colors.blueAccent;
  Color textColor = Colors.white;



  @override
  Widget build(BuildContext context) {
    return(
        Container(
            margin: EdgeInsets.all(10),
            height: 50.0,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: borderColor)),
              onPressed: () {
                this.onPressed();
              },
              padding: EdgeInsets.all(10.0),
              color: buttomColor,
              textColor: textColor,
              child: Text(data.text,
                  style: TextStyle(fontSize: 15)),

            )
    ));
  }


}