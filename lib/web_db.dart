import 'package:drift/web.dart';
import 'package:profile/staff.dart';

MyDatabase constructDb(){
  return MyDatabase(WebDatabase('db'));
}