import 'dart:convert';
import 'dart:io';

class DataService {
  Directory directory = Directory(Directory.current.path + "\\assets\\data");
  late File file;

  Future<void> init() async {
    bool isDirectoryCreated = await directory.exists();
    if (!isDirectoryCreated) {
      await directory.create();
    }
    file = File(directory.path + "\\data.json");
    bool isFileCreated = await file.exists();
    if (!isFileCreated) {
      await file.create();
    }
  }

  Future<bool> storeString({required String key, required String value}) async {
    String source = await file.readAsString();
    Map<String, dynamic> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }
    bool result = false;
    database.addAll({key: value});
    source = jsonEncode(database);
    await file.writeAsString(source).whenComplete(() {
      result = true;
    }).catchError((_) {
      result = false;
    });
    return result;
  }

  Future<bool> storeInt({required String key, required int value}) async {
    String source = await file.readAsString();
    Map<String, dynamic> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }
    bool result = false;
    database.addAll({key: value});
    source = jsonEncode(database);
    await file.writeAsString(source).whenComplete(() {
      result = true;
    }).catchError((_) {
      result = false;
    });
    return result;
  }

  Future<bool> storeDouble({required String key, required double value}) async {
    String source = await file.readAsString();
    Map<String, dynamic> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }
    bool result = false;
    database.addAll({key: value});
    source = jsonEncode(database);
    await file.writeAsString(source).whenComplete(() {
      result = true;
    }).catchError((_) {
      result = false;
    });
    return result;
  }

  Future? readData({required String key}) async {
    String source = await file.readAsString();
    Map<String, dynamic> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }

    return database[key];
  }

  Future<bool> deleteData({required String key}) async {
    // filedan oldingi ma'lumotlarni olepdi
    String source = await file.readAsString();
    // bo'shlikka tekshiradi
    if (source.isEmpty) {
      return false;
    }

    Map<String, dynamic> database;
    // String => Map
    database = jsonDecode(source);
    // o'chirilishi kerak bo'lgan ma'lumotni o'chirdi
    database.remove(key);
    // Map => String
    source = jsonEncode(database);
    // Filega yangi o'zgarishni saqlaydi
    await file.writeAsString(source).catchError((_) {
      /* error msg*/
    });
    return true;
  }

  Future<bool> clearData() async{
    String clear = await file.readAsString();
    if(clear.isEmpty){
      return false;
    }
    Map<String, dynamic> clearDataBase;
    clearDataBase = jsonDecode(clear);
    clearDataBase.clear();
    clear = jsonEncode(clearDataBase);
    await file.writeAsString(clear).catchError((_) {
    });
    return true;
  }

  Future<bool> storeStringList({required String key, required String value}) async {
    String source = await file.readAsString();
    Map<String, List<String>> database;
    if (source.isEmpty) {
      database = {};
    } else {
      database = jsonDecode(source);
    }
    bool result = false;
    database.addAll({key: [value]});
    source = jsonEncode(database);
    await file.writeAsString(source).whenComplete(() {
      result = true;
    }).catchError((_) {
      result = false;
    });
    return result;
  }


}
