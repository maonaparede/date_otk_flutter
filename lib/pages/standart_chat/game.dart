import 'dart:developer';
import 'dart:ui' as ui;



import 'package:date_otk_flutter/Components/text_box.dart';
import 'package:date_otk_flutter/components/button_box.dart';
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/name_dialog.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/service/json_handler/json_reader.dart';
import 'package:date_otk_flutter/test/general_controller_test.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import '../../test/controller_test.dart';
import '../../main.dart';
import 'game_controller.dart';
import 'game_modelview.dart';

class Game extends State<GamePage> {


  //todo Fade nos widgets aparecendo e desaparecendo, provavel uso de states
  //todo botao descer texto
  //todo BD interno -
  // todo - Ele vai pegar todos os Json, guardar o nome do arquivo e o(s) id(s)
  //todo - Pra quando precisar de algum id especifico saber onde pegar o arquivo
  //Ideia - guardar id como chave primaria, msm repetindo nome de arquivo
  //só q dai vai ter q fazer um "interpretador" Json q pegue só o trrecho do id no
  //arquivo - talvez aqls funcoes do javascript (.map .reduce) sejam úteis
  //todo tirar td de dependencia do android manifest e acharr um plugin flutter pra aplicar isso

  @override
  Widget build(BuildContext context) {
    //GeneralControllerTest(context).start();
    //loadTest();
    //ControllerGameTest().start();
    //ModelViewTest().start();
    return _buildGame();
  }

  loadTest() async{
    MapEntry<String, dynamic> response =
    await JsonReader().getModelById(IdFile(id: "bt1", file: "rota2"));



    print(response.key);
    print(response.value);
    //print(a);
  }

  Widget _buildGame(){
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          //Background
          ValueListenableBuilder<String>(
            valueListenable: GameController.instance.background,
            builder: (context , value, _)
            {
              return Image(image: AssetImage(value), fit: BoxFit.cover);
            },
          ),

          //character
          Align(
              alignment: Alignment.bottomCenter,
              child:
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.7,
                child:
                 ValueListenableBuilder<String>(
                    valueListenable: GameController.instance.character,
                    builder: (context , value, _)
                    {
                      return Image(image: AssetImage(value), fit: BoxFit.fill);
                      },
                ),
              ),
          ),

          //Bottoes
          Align(
            alignment: Alignment.center,
            child:
              ValueListenableBuilder<List<ButtonOptions>>(
              valueListenable: GameController.instance.buttons,
                  builder: ( context , value, _ )
              {
                return ListView.builder(
                    itemCount: (value) != null ? value.length : 0,
                    itemBuilder: (context , index) => _buildButton(value[index])
                );
              }),

          ),

          //Texto dialogo
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder<NameDialog>(
              valueListenable: GameController.instance.dialogName,
              builder: (context , value, _)
              {
                return TextBoxName(data: value);
              },
            ),
          ),

        ],
      ),
    );
  }

  _buildButton(ButtonOptions button){
    return ButtomBox(data: button, onPressed: () {_buttonPress(button.idFile);});
  }

  _buttonPress(IdFile idFile){
    log("id: " + idFile.id);
    GameModelView(context).buttonPress(idFile);
  }


}