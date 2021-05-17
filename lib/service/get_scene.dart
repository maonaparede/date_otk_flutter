
import 'package:date_otk_flutter/service/database/db_internal_interface.dart';
import 'package:date_otk_flutter/service/database/sql_lite.dart';

class GetScene{

  DbInternal db = SQLite();

  //retorna um model
  getSceneById(String id) async{
    String file = await db.read(id);
    dynamic model = await jsonReader(file , id);
    return model;
  }

  jsonReader(String file, String id) {
     
  }
}