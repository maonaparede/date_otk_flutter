import 'dart:ui';

import 'package:date_otk_flutter/components/button_box.dart';
import 'package:date_otk_flutter/models/name_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bordered_text/bordered_text.dart';


class TextBoxName extends StatelessWidget {

  TextBoxName({@required this.data,@required this.onPressed});

  ScrollController _scrollControler;

  NameDialog data;

  final VoidCallback onPressed;

  Color borderColor = Colors.black54;

  Color nameColorBc = Colors.blueAccent;

  Color textColor = Colors.white;

  Color textColorBorder = Color(5460819);

  Color speakBg = Colors.black54;

  @override
  Widget build(BuildContext context) {
      return new Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          child: Container(
            height: 244,
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget> [
                    Align(
                        alignment: Alignment.centerLeft,
                        child:
                    _buildName()
                    ),
                    Expanded(child: Align(
                        alignment: Alignment.topRight,
                        child: data.buttonVisible ?
                          IconButton(
                              // ignore: unnecessary_statements
                              onPressed: (){this.onPressed();},
                              iconSize: 45,
                              color: nameColorBc,
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.play_arrow)
                          ) : null
                    ))
                  ]
                ),

                //todo Dialog
                Expanded(
                       child: _buildDialog()
                ),
            ]),
      )
      )
      );
  }

  Widget _buildName() {
    return new Container(
      child: Container(
        decoration:
        BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
            color: nameColorBc,
            border: Border.all(width: 1.0, color: borderColor)
        ),
        child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 11.0, 10.0, 8.0),

            child: BorderedText(
              strokeWidth: 2.0,
              strokeColor: textColorBorder,

              child: Text(data.name, style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.7
              )
              ),
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
      child: _buildScrollStyle()
    );
  }

  Widget _buildScrollStyle(){
    _scrollControler =  ScrollController();
    return new Container(
        child: Padding(
              padding: EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 10),
              child:
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:
                Row(children: <Widget>[ Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: new BorderedText(
                          strokeWidth: 2.0,
                          strokeColor: textColorBorder,
                          child: Text(data.dialog, style:
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
                ),],),
              ),
          ));
  }
}
