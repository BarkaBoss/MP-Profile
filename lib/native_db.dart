import 'package:drift/native.dart';
import 'package:profile/staff.dart';

MyDatabase constructDb(){
  final db = MyDatabase(NativeDatabase.memory());
  return db;
}