

import 'package:date_otk_flutter/pages/standart_chat/chat_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module{


  @override
  List<Bind> get binds {
    return[
      Bind.singleton((i) => ChatController())
    ];
  }


}