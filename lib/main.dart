import 'package:analyzer/dart/ast/ast.dart';
import 'package:drift/native.dart';
import 'package:profile/ImageStrings.dart';
import 'staff.dart';

Future<void> main() async{
  
  final db = MyDatabase(NativeDatabase.memory());

  (await db.select(db.staff).get()).forEach(print);

  await db.into(db.staff).insert(StaffCompanion.insert(name: "Sarki Amada", gender: "Male", position: "CEO", staffID: "126VG87ABJ", dateOfBirth: "20/10/1972", imageBaseSixFour: ImageStrings.anotherStaffImage));
  await db.into(db.staff).insert(StaffCompanion.insert(name: "Rose Amada", gender: "Female", position: "SEO", staffID: "126VG87ABJ", dateOfBirth: "20/10/2006", imageBaseSixFour: ImageStrings.ceo));
  (await db.select(db.staff).get()).forEach(print);
}