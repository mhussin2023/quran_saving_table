import 'package:shared_preferences/shared_preferences.dart';

class BoolStorage {
  static const String key = "boolList";
  static bool listType=false;
  static List<bool> checkStatus_initialValue = List.filled(114, false);
  static List<bool> checkStatus=[];
  static int builCounter=0;
  // Save list of bools
  static Future<void> saveBoolList() async {
    print('start saving data');
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = checkStatus.map((b) => b.toString()).toList();
    await prefs.setStringList(key, stringList);
    print(stringList);
    print('finished saving data');
  }

  // Retrieve list of bools
  static  Future<void> getBoolList() async {
    print('start getting data');
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = prefs.getStringList(key);
    if(stringList==null || stringList.isEmpty || stringList==[] || stringList.length!=114){
      checkStatus=checkStatus_initialValue;

    }else {
      checkStatus = stringList?.map((s) => s == "true").toList() ?? [];
    }
    print('finished getting data');
    print(checkStatus);
    //return stringList?.map((s) => s == "true").toList() ?? [];
  }
}