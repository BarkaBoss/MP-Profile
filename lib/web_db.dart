import 'package:drift/web.dart';
import 'package:micro_press_profile/staff.dart';

MyDatabase constructDb(){
  return MyDatabase(WebDatabase(DateTime.now().toString()));
}