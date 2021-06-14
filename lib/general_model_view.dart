

import 'package:date_otk_flutter/main.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/pages/standart_chat/chat_modelview.dart';
import 'package:date_otk_flutter/service/get_scene.dart';
import 'package:date_otk_flutter/service/id_file_handler_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class GeneralModelView{

  final List<Object> multiSceneObject = [
    ListButtonOptions
  ];


  //todo lógica do next Scene para salvar o id e file currrent e
  // todo tb pra mudar de cena
  
  nextAction(IdFile idFile , BuildContext context, dynamic modelView) async {
    dynamic scene = await GetScene().getSceneById(idFile);

    if (scene != null){
      if (multiSceneObject.contains(scene.runtimeType)) {
          print("entrou");
          await updateScene(scene, modelView);
          return;
      }else{
        print("saiu");
        //await saveProgress(scene.idFile);
        //await newScene(scene, context ,modelView);
        await updateScene(scene, modelView);
        return;
      }
    }

    return;
  }

  saveProgress(IdFile scene) async{
    await IdFileSharedPreferencesHandler().setIdFile(scene.id, scene.file);
    return;
  }

  newScene(dynamic scene, BuildContext context, dynamic modelView) async{
    String idScene = scene.idFile.id.substring(0,2);

    //o id leva a outra tela
    if(idScene != null) {
      switch (idScene) {
        case "ch":
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatPage()),
          );
          break;
        default:
          return;
          break;
      }
    }

    return;
  }

  updateScene(Object scene, dynamic modelView) async{
          switch(modelView){
            case ChatModelView:
              await ChatModelView().updateModel(scene);
              break;
          }
    return;
  }





}