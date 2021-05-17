
import 'package:date_otk_flutter/general_model_view.dart';
import 'package:date_otk_flutter/models/button_options.dart';
import 'package:date_otk_flutter/models/chat_model.dart';
import 'package:date_otk_flutter/models/dialog_name.dart';
import 'package:date_otk_flutter/pages/standart_chat/game_controller.dart';
import 'package:date_otk_flutter/test/controller_test.dart';
import 'package:date_otk_flutter/test/modelView_test.dart';

class GeneralControllerTest{


    var context;

    ChatModel a =
    ChatModel(DialogName("... rgrgrggr", "egeg"), "assets/images/pp-removebg-preview.png", "assets/images/wlop.jpg");

    GeneralControllerTest(this.context);
    
     Future start() async {
      await Future.delayed(Duration(seconds: 3));
      // await GameController.instance.setBackground("assets/images/pp-removebg-preview.png");
      await GeneralModelView().nextAction("chtest", ModelViewTest(context).returnGameModelView(), a);
    }
}