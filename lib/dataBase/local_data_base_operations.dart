import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalDataBase {
  static Future<Box> getBox({required String boxName}) async {
    Box box;
    String path = (await getApplicationDocumentsDirectory()).path;
    if (await (Hive.boxExists("Data", path: path))) {
      return await Hive.openBox("Data", path: path);
    } else {
      Hive.init(path);
      box = await Hive.openBox("Data");
      return box;
    }
  }
}
