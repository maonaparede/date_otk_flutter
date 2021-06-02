
import 'package:date_otk_flutter/models/name_dialog.dart';
import 'package:date_otk_flutter/models/id_file.dart';

class ChatModel{
  IdFile idFile;
  NameDialog dialogName;
  String background;
  String character;

  ChatModel(this.idFile, this.dialogName, this.background, this.character);
}