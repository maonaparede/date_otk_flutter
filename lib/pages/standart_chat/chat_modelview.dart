


import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/pages/pages_interface.dart';
import 'package:date_otk_flutter/pages/standart_chat/chat_controller.dart';
import 'package:flutter/material.dart';

class ChatModelView extends PagesInterface{

    @override
    var controller = ChatController.instance;

    @override
    var modelView = ChatModelView;

    String prefix = "assets/images/";

    _updateChatModel(chatModel) async{

      if(chatModel.idFile != null){
        controller.setIdFile(chatModel.idFile);
      }
      if(chatModel.background != null){
        controller.setBackground(prefix+chatModel.background);
      }
      if(chatModel.character != null){
        controller.setCharacter(prefix+chatModel.character);
      }
      if(chatModel.dialogName != null){
        controller.setDialogName(chatModel.dialogName);
      }
    }

    @override
    updateModel(Object model1) async {
      switch (model1.runtimeType) {
        case ListButtonOptions:
          await controller.setDialogButtonVisible(false);
          await showButtons(model1);
          break;
        default:
          removeButtons();
          await controller.setDialogButtonVisible(true);
          await _updateChatModel(model1);
          break;
      }
    }

    pressButtonNext(BuildContext context){
      buttonPress(controller.idFile, context);
      return;
    }


}