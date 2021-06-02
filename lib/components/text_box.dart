import 'dart:ui';

import 'package:date_otk_flutter/models/name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bordered_text/bordered_text.dart';

class TextBoxName extends StatefulWidget {
  TextBoxName({@required this.data});

  final NameDialog data;

  @override
  _TextBoxNameState createState() => _TextBoxNameState();
}

class _TextBoxNameState extends State<TextBoxName> {
  ScrollController _scrollControler;

  Color borderColor = Colors.black54;

  Color nameColorBc = Colors.blueAccent;

  Color textColor = Colors.white;

  Color textColorBorder = Color(5460819);

  Color speakBg = Colors.black54;

  @override
  Widget build(BuildContext context) {

      return new Container(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            height: 244,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget> [
                    _buildName()
                  ]
                ),

                //todo Dialog
                Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 1,
                       child: _buildDialog()
                ),
            ]),
      )
      )
      );
  }

  Widget _buildName() {
    return new Container(
      decoration:
      BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
          color: nameColorBc,
          border: Border.all(width: 2.0, color: borderColor)
      ),

      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),

          child: BorderedText(
            strokeWidth: 2.0,
            strokeColor: textColorBorder,

            child: Text(widget.data.name, style: TextStyle(
                color: Colors.white,
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.7
            )),
          ),

        ),

      ),
    );
  }

  Widget _buildDialog() {
    return new Container(
      decoration:
      BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)
      ),

          color: speakBg,
          border: Border.all(width: 4.0, color: nameColorBc)
      ),
      child: _buildcrollStyle()
    );
  }

  Widget _buildcrollStyle(){
    _scrollControler =  ScrollController();
    return new
            Padding(
              padding: EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: new BorderedText(
                          strokeWidth: 2.0,
                          strokeColor: textColorBorder,
                          child: Text(widget.data.dialog, style:
                            TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontFamily: 'Rimousky',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.7
                            )
                          ),
                        ),
                      )
                    ],
                )
              ),
    );
  }
}
