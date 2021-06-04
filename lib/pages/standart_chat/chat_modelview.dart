


import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/chat_model.dart';
import 'package:date_otk_flutter/models/list_button_options.dart';
import 'package:date_otk_flutter/pages/pages_interface.dart';
import 'package:date_otk_flutter/pages/standart_chat/chat_controller.dart';
import 'package:flutter/material.dart';

class ChatModelView extends PagesInterface{

    @override
    var controller = ChatController.instance;

    @override
    var model = ChatModelView;


    _updateChatModel(chatModel) async{
      if(chatModel.background != null){
        ChatController.instance.setBackground(chatModel.background);
      }
      if(chatModel.character != null){
        ChatController.instance.setCharacter(chatModel.character);
      }
      if(chatModel.dialogName != null){
        controller.setDialogName(chatModel.dialogName);
      }
    }

    @override
    updateModel(Object model1) async {
      switch (model1) {
        case ListButtonOptions:
          await showButtons(model1);
          break;
        default:
          await _updateChatModel(model1);
          break;
      }
    }



}