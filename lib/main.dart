

import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/pages/landing.dart';
import 'package:date_otk_flutter/pages/standart_chat/chat.dart';
import 'package:date_otk_flutter/service/id_file_handler_shared_preferences.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //Rotas para as paginas.
      initialRoute: '/chat',

      routes: {
        '/': (context) => MyHomePage(),
        '/chat': (context) => ChatPage()
      },

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  Landing createState() => Landing();
}


class ChatPage extends StatefulWidget {

  @override
  createState() => Chat();
}


