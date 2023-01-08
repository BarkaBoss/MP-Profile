// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// ignore_for_file: type=lint
class $StaffTable extends Staff with TableInfo<$StaffTable, StaffData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StaffTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _positionMeta =
      const VerificationMeta('position');
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
      'position', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _staffIDMeta =
      const VerificationMeta('staffID');
  @override
  late final GeneratedColumn<String> staffID = GeneratedColumn<String>(
      'staff_i_d', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<String> dateOfBirth = GeneratedColumn<String>(
      'date_of_birth', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageBaseSixFourMeta =
      const VerificationMeta('imageBaseSixFour');
  @override
  late final GeneratedColumn<String> imageBaseSixFour = GeneratedColumn<String>(
      'image_base_six_four', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, gender, position, staffID, dateOfBirth, imageBaseSixFour];
  @override
  String get aliasedName => _alias ?? 'staff';
  @override
  String get actualTableName => 'staff';
  @override
  VerificationContext validateIntegrity(Insertable<StaffData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('staff_i_d')) {
      context.handle(_staffIDMeta,
          staffID.isAcceptableOrUnknown(data['staff_i_d']!, _staffIDMeta));
    } else if (isInserting) {
      context.missing(_staffIDMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('image_base_six_four')) {
      context.handle(
          _imageBaseSixFourMeta,
          imageBaseSixFour.isAcceptableOrUnknown(
              data['image_base_six_four']!, _imageBaseSixFourMeta));
    } else if (isInserting) {
      context.missing(_imageBaseSixFourMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StaffData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StaffData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      position: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}position'])!,
      staffID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_i_d'])!,
      dateOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_of_birth'])!,
      imageBaseSixFour: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}image_base_six_four'])!,
    );
  }

  @override
  $StaffTable createAlias(String alias) {
    return $StaffTable(attachedDatabase, alias);
  }
}

class StaffData extends DataClass implements Insertable<StaffData> {
  final int id;
  final String name;
  final String gender;
  final String position;
  final String staffID;
  final String dateOfBirth;
  final String imageBaseSixFour;
  const StaffData(
      {required this.id,
      required this.name,
      required this.gender,
      required this.position,
      required this.staffID,
      required this.dateOfBirth,
      required this.imageBaseSixFour});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['gender'] = Variable<String>(gender);
    map['position'] = Variable<String>(position);
    map['staff_i_d'] = Variable<String>(staffID);
    map['date_of_birth'] = Variable<String>(dateOfBirth);
    map['image_base_six_four'] = Variable<String>(imageBaseSixFour);
    return map;
  }

  StaffCompanion toCompanion(bool nullToAbsent) {
    return StaffCompanion(
      id: Value(id),
      name: Value(name),
      gender: Value(gender),
      position: Value(position),
      staffID: Value(staffID),
      dateOfBirth: Value(dateOfBirth),
      imageBaseSixFour: Value(imageBaseSixFour),
    );
  }

  factory StaffData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StaffData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<String>(json['gender']),
      position: serializer.fromJson<String>(json['position']),
      staffID: serializer.fromJson<String>(json['staffID']),
      dateOfBirth: serializer.fromJson<String>(json['dateOfBirth']),
      imageBaseSixFour: serializer.fromJson<String>(json['imageBaseSixFour']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<String>(gender),
      'position': serializer.toJson<String>(position),
      'staffID': serializer.toJson<String>(staffID),
      'dateOfBirth': serializer.toJson<String>(dateOfBirth),
      'imageBaseSixFour': serializer.toJson<String>(imageBaseSixFour),
    };
  }

  StaffData copyWith(
          {int? id,
          String? name,
          String? gender,
          String? position,
          String? staffID,
          String? dateOfBirth,
          String? imageBaseSixFour}) =>
      StaffData(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        position: position ?? this.position,
        staffID: staffID ?? this.staffID,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        imageBaseSixFour: imageBaseSixFour ?? this.imageBaseSixFour,
      );
  @override
  String toString() {
    return (StringBuffer('StaffData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('position: $position, ')
          ..write('staffID: $staffID, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('imageBaseSixFour: $imageBaseSixFour')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, gender, position, staffID, dateOfBirth, imageBaseSixFour);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StaffData &&
          other.id == this.id &&
          other.name == this.name &&
          other.gender == this.gender &&
          other.position == this.position &&
          other.staffID == this.staffID &&
          other.dateOfBirth == this.dateOfBirth &&
          other.imageBaseSixFour == this.imageBaseSixFour);
}

class StaffCompanion extends UpdateCompanion<StaffData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> gender;
  final Value<String> position;
  final Value<String> staffID;
  final Value<String> dateOfBirth;
  final Value<String> imageBaseSixFour;
  const StaffCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
    this.position = const Value.absent(),
    this.staffID = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.imageBaseSixFour = const Value.absent(),
  });
  StaffCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String gender,
    required String position,
    required String staffID,
    required String dateOfBirth,
    required String imageBaseSixFour,
  })  : name = Value(name),
        gender = Value(gender),
        position = Value(position),
        staffID = Value(staffID),
        dateOfBirth = Value(dateOfBirth),
        imageBaseSixFour = Value(imageBaseSixFour);
  static Insertable<StaffData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? gender,
    Expression<String>? position,
    Expression<String>? staffID,
    Expression<String>? dateOfBirth,
    Expression<String>? imageBaseSixFour,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (gender != null) 'gender': gender,
      if (position != null) 'position': position,
      if (staffID != null) 'staff_i_d': staffID,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (imageBaseSixFour != null) 'image_base_six_four': imageBaseSixFour,
    });
  }

  StaffCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? gender,
      Value<String>? position,
      Value<String>? staffID,
      Value<String>? dateOfBirth,
      Value<String>? imageBaseSixFour}) {
    return StaffCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      position: position ?? this.position,
      staffID: staffID ?? this.staffID,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      imageBaseSixFour: imageBaseSixFour ?? this.imageBaseSixFour,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (staffID.present) {
      map['staff_i_d'] = Variable<String>(staffID.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<String>(dateOfBirth.value);
    }
    if (imageBaseSixFour.present) {
      map['image_base_six_four'] = Variable<String>(imageBaseSixFour.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StaffCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('position: $position, ')
          ..write('staffID: $staffID, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('imageBaseSixFour: $imageBaseSixFour')
          ..write(')'))
        .toString();
  }
}

class StaffViewData extends DataClass {
  final String name;
  const StaffViewData({required this.name});
  factory StaffViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StaffViewData(
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
    };
  }

  StaffViewData copyWith({String? name}) => StaffViewData(
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('StaffViewData(')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => name.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StaffViewData && other.name == this.name);
}

class $StaffViewView extends ViewInfo<$StaffViewView, StaffViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$MyDatabase attachedDatabase;
  $StaffViewView(this.attachedDatabase, [this._alias]);
  $StaffTable get staff => attachedDatabase.staff.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [name];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'staff_view';
  @override
  String? get createViewStmt => null;
  @override
  $StaffViewView get asDslTable => this;
  @override
  StaffViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StaffViewData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      generatedAs: GeneratedAs(staff.name, false), type: DriftSqlType.string);
  @override
  $StaffViewView createAlias(String alias) {
    return $StaffViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(staff)..addColumns($columns));
  @override
  Set<String> get readTables => const {'staff'};
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $StaffTable staff = $StaffTable(this);
  late final $StaffViewView staffView = $StaffViewView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [staff, staffView];
}
