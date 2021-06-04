import 'package:date_otk_flutter/components/button_box.dart';
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Landing extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
          body: Center(child: ButtomBox(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
            }, data: ButtonOptions(text: "salve", idFile: null),
          ),
          ),
        )
    );
  }
}