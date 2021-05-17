

import 'package:date_otk_flutter/pages/landing.dart';
import 'package:date_otk_flutter/pages/standart_chat/game.dart';
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
      initialRoute: '/game',

      routes: {
        '/': (context) => MyHomePage(),
        '/game': (context) => GamePage()
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

class GamePage extends StatefulWidget {
  @override
  Game createState() => Game();
}

