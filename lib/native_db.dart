import 'package:drift/native.dart';
import 'package:micro_press_profile/staff.dart';

MyDatabase constructDb(){
  final db = MyDatabase(NativeDatabase.memory());
  return db;
}