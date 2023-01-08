import 'package:drift/drift.dart';

part 'staff.g.dart';

class Staff extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get gender => text()();
  TextColumn get position => text()();
  TextColumn get staffID => text()();
  TextColumn get dateOfBirth => text()();
  TextColumn get imageBaseSixFour => text()();
}

abstract class StaffView extends View{
  Staff get staff;

  @override
  Query as() => select(
    [
      staff.name
    ]
  ).from(staff);

}

@DriftDatabase(tables:[Staff], views:[StaffView])
class MyDatabase extends _$MyDatabase{
  MyDatabase(QueryExecutor e): super(e);

  @override
  int get schemaVersion => 1;
}