import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/name_dialog.dart';

import 'package:flutter/foundation.dart';

  class GameController{
    static final GameController instance = GameController._();
    //construtor privado
    GameController._();



    final dialogName = ValueNotifier<NameDialog>(NameDialog("..." , "..."));
    final background = ValueNotifier<String>("assets/images/wlop.jpg");
    final character = ValueNotifier<String>("assets/images/pp-removebg-preview.png");
    final buttons = ValueNotifier<List<ButtonOptions>>(null);


    setDialogName(NameDialog value){
      dialogName.value = value;
    }

    setBackground(String value){
      background.value = value;
    }

    setCharacter(String value){
      character.value = value;
    }

    setButtons(List<ButtonOptions> value){
      buttons.value = value;
    }

 }