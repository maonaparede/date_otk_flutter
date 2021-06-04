import 'package:date_otk_flutter/components/button_box.dart';
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Landing extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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