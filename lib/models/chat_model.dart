
import 'package:date_otk_flutter/models/dialog_name.dart';
import 'package:date_otk_flutter/models/id_file.dart';

class ChatModel{
  IdFile idFile;
  DialogName dialogName;
  String background;
  String character;

  ChatModel(this.idFile, this.dialogName, this.background, this.character);
}