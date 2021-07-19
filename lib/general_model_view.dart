

import 'package:date_otk_flutter/main.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/pages/standart_chat/chat_modelview.dart';
import 'package:date_otk_flutter/service/get_scene.dart';
import 'package:date_otk_flutter/service/shared_preferences_handler.dart';
import 'package:date_otk_flutter/service/shared_preferences/shared_preferences_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class GeneralModelView{

  final List<Object> _multiSceneObject = [
    ListButtonOptions
  ];


  nextAction(IdFile idFile , BuildContext context, dynamic modelView) async {
    dynamic scene = await GetScene().getSceneById(idFile);

    if (scene != null){
      if (_multiSceneObject.contains(scene.runtimeType)) {
          await _updateScene(scene, modelView);
          return;
      }else{
        await _handleScene(idFile ,scene, context ,modelView);
        return;
      }
    }

    return;
  }

  _handleScene(IdFile idFile,dynamic scene, BuildContext context, dynamic modelViewNew) async{
    String modelViewOld = await SharedPreferencesHandler().readOldModelView();

    if (modelViewOld != null) {
      await _saveProgress(idFile, modelViewNew.toString());

        if(modelViewNew.toString() == modelViewOld){
          await _updateScene(scene, modelViewNew);
        }else{
          await _newScreen(scene, context, modelViewNew);
        }
    }
  }

  _saveProgress(IdFile scene, String modelView) async{
    await SharedPreferencesHandler().setOldModelView(modelView);
    await SharedPreferencesHandler().setIdFile(scene.id, scene.file);
    return;
  }

  _newScreen(dynamic scene, BuildContext context, dynamic modelView) async{
    String idScene = scene.idFile.id.substring(0,2);

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

  _updateScene(Object scene, dynamic modelView) async{
          switch(modelView){
            case ChatModelView:
              await ChatModelView().updateModel(scene);
              break;
          }
    return;
  }

  initScene(Object scene, dynamic modelView){
    SharedPreferencesValues().create("oldModelView" , modelView.toString());
    _updateScene(scene, modelView);
    return;
  }
}