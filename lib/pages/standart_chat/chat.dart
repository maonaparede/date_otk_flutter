import 'dart:developer';
import 'dart:ui' as ui;




import 'package:date_otk_flutter/components/button_box.dart';
import 'package:date_otk_flutter/components/text_box.dart';
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/name_dialog.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/service/shared_preferences_handler.dart';
import 'package:date_otk_flutter/service/shared_preferences/shared_preferences_values.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../test/controller_test.dart';
import '../../main.dart';
import 'chat_controller.dart';
import 'chat_modelview.dart';

class Chat extends State<ChatPage> {


  //todo Fade nos widgets aparecendo e desaparecendo, provavel uso de states
  //todo botao descer texto


  var controller = ChatController.instance;

  @override
  Widget build(BuildContext context) {
    return _buildGame();
  }

  @override
  void initState(){
    initScene();
    super.initState();
  }

  initScene() async{
    String a = await SharedPreferencesValues().read("idScene");
    print(a + " resultado fetaf");
    //await SharedPreferencesValues().delete("fileScene");
    //await SharedPreferencesValues().delete("idScene");
    //await SharedPreferencesValues().delete("oldModelView");
    ChatModelView().initScene();
  }



  Widget _buildGame(){
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[



          //Background
          ValueListenableBuilder<String>(
            valueListenable: controller.background,
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
                    valueListenable: controller.character,
                    builder: (context , value, _)
                    {
                      return AnimatedOpacity(
                          opacity: controller.characterVisible ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 1000),

                       child: Image(image: AssetImage(value), fit: BoxFit.fill)
                      );
                      },
                ),
              ),
          ),

          //Bottoes
          Align(
            alignment: Alignment.center,
            child:
              ValueListenableBuilder<List<ButtonOptions>>(
              valueListenable: controller.buttons,
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
              valueListenable: controller.dialogName,
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
    ChatModelView().buttonPress(idFile, context);
  }


}