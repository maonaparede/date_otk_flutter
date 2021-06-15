import 'dart:developer';
import 'dart:ui' as ui;




import 'package:date_otk_flutter/components/button_box.dart';
import 'package:date_otk_flutter/components/text_box.dart';
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/name_dialog.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/service/id_file_handler_shared_preferences.dart';
import 'package:date_otk_flutter/service/shared_preferences/shared_preferences_values.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../test/controller_test.dart';
import '../../main.dart';
import 'chat_controller.dart';
import 'chat_modelview.dart';

class Chat extends State<ChatPage> {


  //todo Fade nos widgets aparecendo e desaparecendo, provavel uso de states
  //todo botao descer texto
  //Ideia - guardar id como chave primaria, msm repetindo nome de arquivo
  //só q dai vai ter q fazer um "interpretador" Json q pegue só o trrecho do id no
  //arquivo - talvez aqls funcoes do javascript (.map .reduce) sejam úteis
  //todo tirar td de dependencia do android manifest e acharr um plugin flutter pra aplicar isso


  @override
  Widget build(BuildContext context) {
    //GeneralControllerTest(context).start();
    //ControllerGameTest().start();
    //ModelViewTest().start();
    //loadTest();
    return _buildGame();
  }

  @override
  void initState(){
    loadTest();
    super.initState();
  }

  loadTest() async{
    String a = await SharedPreferencesValues().read("idScene");
    print(a + " resultado fetaf");
    //await SharedPreferencesValues().delete("fileScene");
    //await SharedPreferencesValues().delete("idScene");
    //await SharedPreferencesValues().delete("oldModelView");
    ChatModelView().initScene();
    //await ControllerGameTest().start();
    //print(idFile.id);
  }

  Widget _buildGame(){
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          //Background
          ValueListenableBuilder<String>(
            valueListenable: ChatController.instance.background,
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
                    valueListenable: ChatController.instance.character,
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
              valueListenable: ChatController.instance.buttons,
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
              valueListenable: ChatController.instance.dialogName,
              builder: (context , value, _)
              {
                return TextBoxName(data: value, onPressed: () {_buttonNextPress();},);
              },
            ),
          ),

        ],
      ),
    );
  }

  _buildButton(ButtonOptions button){
    return ButtomBox(data: button, onPressed: () {_buttonListPress(button.idFile);});
  }

  _buttonNextPress(){
    ChatModelView().pressButtonNext(context);
  }

  _buttonListPress(IdFile idFile){
    log("id: " + idFile.id + " file: " + idFile.file);
    ChatModelView().buttonPress(idFile, context);
  }


}