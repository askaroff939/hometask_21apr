import 'dart:io';
import 'package:hometask_21apr/services/data_service.dart';
import 'package:hometask_21apr/services/ext_service.dart';
import 'package:hometask_21apr/services/io_service.dart';

void main() async {
  // DataService dataService = DataService();
  // await dataService.init();
  //
  // writeln("Qaysi ma'lumotni o'chirmoqchisiz?: ");
  // String text = read();
  //
  // dataService.deleteData(key: text).then((value) {
  //   writeln(value);
  // });

  // DataService dataService = DataService();
  // await dataService.init();
  //
  // writeln("Iltimos passwordni kiriting: ");
  // int password = read().toInt;
  // bool result = await dataService.storeInt(key: "Password", value: password);
  //
  // if(result) {
  //   writeln("Pasword muvofaqiyatli o'rnatildi");
  // } else {
  //   writeln("Please try again later!!!");
  // }

  DataService dataService = DataService();
  await dataService.init();

  writeln("Iltimos passwordni kiriting: ");
  double password = read().toDouble;
  bool result = await dataService.storeDouble(key: "Password", value: password);

  if (result) {
    writeln("Pasword muvofaqiyatli o'rnatildi");
  } else {
    writeln("Please try again later!!!");
  }
}
