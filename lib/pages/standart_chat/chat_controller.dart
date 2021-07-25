import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/id_file.dart';
import 'package:date_otk_flutter/models/name_dialog.dart';

import 'package:flutter/foundation.dart';

  class ChatController{

    static final ChatController instance = ChatController._();
    //construtor privado
    ChatController._();

    final dialogName = ValueNotifier<NameDialog>(NameDialog("..." , "...", true));
    final background = ValueNotifier<String>("assets/images/wlop.jpg");
    final character = ValueNotifier<String>("assets/images/saber.png");
    final buttons = ValueNotifier<List<ButtonOptions>>(null);
    bool characterVisible = false;
    IdFile idFile = IdFile( id: null, file: null);

    setCharacterVisible(bool value){
      this.characterVisible = value;
    }

    setIdFile(IdFile idFile){
      this.idFile = idFile;
    }

    setDialogName(NameDialog value){
      dialogName.value = value;
    }

    setDialogButtonVisible(bool value){
      dialogName.value.buttonVisible = value;
      // ignore: invalid_use_of_visible_for_testing_member
      dialogName.notifyListeners();
    }

    setBackground(String value){
      background.value = value;
    }

    setCharacter(String value){
      character.value = value;
    }

    setButtons(List<ButtonOptions> value) async{
      buttons.value = value;
      return;
    }

 }