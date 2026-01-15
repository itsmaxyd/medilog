// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sexMeta = const VerificationMeta('sex');
  @override
  late final GeneratedColumn<String> sex = GeneratedColumn<String>(
    'sex',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, age, sex, emoji, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Profile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('sex')) {
      context.handle(
        _sexMeta,
        sex.isAcceptableOrUnknown(data['sex']!, _sexMeta),
      );
    } else if (isInserting) {
      context.missing(_sexMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    } else if (isInserting) {
      context.missing(_emojiMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
      sex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sex'],
      )!,
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
  final int id;
  final String name;
  final int age;
  final String sex;
  final String emoji;
  final DateTime createdAt;
  const Profile({
    required this.id,
    required this.name,
    required this.age,
    required this.sex,
    required this.emoji,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    map['sex'] = Variable<String>(sex);
    map['emoji'] = Variable<String>(emoji);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      name: Value(name),
      age: Value(age),
      sex: Value(sex),
      emoji: Value(emoji),
      createdAt: Value(createdAt),
    );
  }

  factory Profile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      sex: serializer.fromJson<String>(json['sex']),
      emoji: serializer.fromJson<String>(json['emoji']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'sex': serializer.toJson<String>(sex),
      'emoji': serializer.toJson<String>(emoji),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Profile copyWith({
    int? id,
    String? name,
    int? age,
    String? sex,
    String? emoji,
    DateTime? createdAt,
  }) => Profile(
    id: id ?? this.id,
    name: name ?? this.name,
    age: age ?? this.age,
    sex: sex ?? this.sex,
    emoji: emoji ?? this.emoji,
    createdAt: createdAt ?? this.createdAt,
  );
  Profile copyWithCompanion(ProfilesCompanion data) {
    return Profile(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
      sex: data.sex.present ? data.sex.value : this.sex,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('sex: $sex, ')
          ..write('emoji: $emoji, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, age, sex, emoji, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.sex == this.sex &&
          other.emoji == this.emoji &&
          other.createdAt == this.createdAt);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> age;
  final Value<String> sex;
  final Value<String> emoji;
  final Value<DateTime> createdAt;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.sex = const Value.absent(),
    this.emoji = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int age,
    required String sex,
    required String emoji,
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       age = Value(age),
       sex = Value(sex),
       emoji = Value(emoji);
  static Insertable<Profile> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? sex,
    Expression<String>? emoji,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (sex != null) 'sex': sex,
      if (emoji != null) 'emoji': emoji,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? age,
    Value<String>? sex,
    Value<String>? emoji,
    Value<DateTime>? createdAt,
  }) {
    return ProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      sex: sex ?? this.sex,
      emoji: emoji ?? this.emoji,
      createdAt: createdAt ?? this.createdAt,
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
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (sex.present) {
      map['sex'] = Variable<String>(sex.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('sex: $sex, ')
          ..write('emoji: $emoji, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HealthConditionsTable extends HealthConditions
    with TableInfo<$HealthConditionsTable, HealthCondition> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthConditionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _diagnosedAtMeta = const VerificationMeta(
    'diagnosedAt',
  );
  @override
  late final GeneratedColumn<DateTime> diagnosedAt = GeneratedColumn<DateTime>(
    'diagnosed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    name,
    type,
    diagnosedAt,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'health_conditions';
  @override
  VerificationContext validateIntegrity(
    Insertable<HealthCondition> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('diagnosed_at')) {
      context.handle(
        _diagnosedAtMeta,
        diagnosedAt.isAcceptableOrUnknown(
          data['diagnosed_at']!,
          _diagnosedAtMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HealthCondition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthCondition(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      diagnosedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}diagnosed_at'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $HealthConditionsTable createAlias(String alias) {
    return $HealthConditionsTable(attachedDatabase, alias);
  }
}

class HealthCondition extends DataClass implements Insertable<HealthCondition> {
  final int id;
  final int profileId;
  final String name;
  final String? type;
  final DateTime? diagnosedAt;
  final String? notes;
  const HealthCondition({
    required this.id,
    required this.profileId,
    required this.name,
    this.type,
    this.diagnosedAt,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || diagnosedAt != null) {
      map['diagnosed_at'] = Variable<DateTime>(diagnosedAt);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  HealthConditionsCompanion toCompanion(bool nullToAbsent) {
    return HealthConditionsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      name: Value(name),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      diagnosedAt: diagnosedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(diagnosedAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory HealthCondition.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthCondition(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String?>(json['type']),
      diagnosedAt: serializer.fromJson<DateTime?>(json['diagnosedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String?>(type),
      'diagnosedAt': serializer.toJson<DateTime?>(diagnosedAt),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  HealthCondition copyWith({
    int? id,
    int? profileId,
    String? name,
    Value<String?> type = const Value.absent(),
    Value<DateTime?> diagnosedAt = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => HealthCondition(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    name: name ?? this.name,
    type: type.present ? type.value : this.type,
    diagnosedAt: diagnosedAt.present ? diagnosedAt.value : this.diagnosedAt,
    notes: notes.present ? notes.value : this.notes,
  );
  HealthCondition copyWithCompanion(HealthConditionsCompanion data) {
    return HealthCondition(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      diagnosedAt: data.diagnosedAt.present
          ? data.diagnosedAt.value
          : this.diagnosedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthCondition(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('diagnosedAt: $diagnosedAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, profileId, name, type, diagnosedAt, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthCondition &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.name == this.name &&
          other.type == this.type &&
          other.diagnosedAt == this.diagnosedAt &&
          other.notes == this.notes);
}

class HealthConditionsCompanion extends UpdateCompanion<HealthCondition> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> name;
  final Value<String?> type;
  final Value<DateTime?> diagnosedAt;
  final Value<String?> notes;
  const HealthConditionsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.diagnosedAt = const Value.absent(),
    this.notes = const Value.absent(),
  });
  HealthConditionsCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String name,
    this.type = const Value.absent(),
    this.diagnosedAt = const Value.absent(),
    this.notes = const Value.absent(),
  }) : profileId = Value(profileId),
       name = Value(name);
  static Insertable<HealthCondition> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<DateTime>? diagnosedAt,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (diagnosedAt != null) 'diagnosed_at': diagnosedAt,
      if (notes != null) 'notes': notes,
    });
  }

  HealthConditionsCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? name,
    Value<String?>? type,
    Value<DateTime?>? diagnosedAt,
    Value<String?>? notes,
  }) {
    return HealthConditionsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      name: name ?? this.name,
      type: type ?? this.type,
      diagnosedAt: diagnosedAt ?? this.diagnosedAt,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (diagnosedAt.present) {
      map['diagnosed_at'] = Variable<DateTime>(diagnosedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthConditionsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('diagnosedAt: $diagnosedAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $DoctorVisitsTable extends DoctorVisits
    with TableInfo<$DoctorVisitsTable, DoctorVisit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoctorVisitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _doctorNameMeta = const VerificationMeta(
    'doctorName',
  );
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
    'doctor_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doctorContactMeta = const VerificationMeta(
    'doctorContact',
  );
  @override
  late final GeneratedColumn<String> doctorContact = GeneratedColumn<String>(
    'doctor_contact',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hospitalMeta = const VerificationMeta(
    'hospital',
  );
  @override
  late final GeneratedColumn<String> hospital = GeneratedColumn<String>(
    'hospital',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _visitDateMeta = const VerificationMeta(
    'visitDate',
  );
  @override
  late final GeneratedColumn<DateTime> visitDate = GeneratedColumn<DateTime>(
    'visit_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _followUpDateMeta = const VerificationMeta(
    'followUpDate',
  );
  @override
  late final GeneratedColumn<DateTime> followUpDate = GeneratedColumn<DateTime>(
    'follow_up_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    doctorName,
    doctorContact,
    hospital,
    visitDate,
    notes,
    followUpDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'doctor_visits';
  @override
  VerificationContext validateIntegrity(
    Insertable<DoctorVisit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
        _doctorNameMeta,
        doctorName.isAcceptableOrUnknown(data['doctor_name']!, _doctorNameMeta),
      );
    } else if (isInserting) {
      context.missing(_doctorNameMeta);
    }
    if (data.containsKey('doctor_contact')) {
      context.handle(
        _doctorContactMeta,
        doctorContact.isAcceptableOrUnknown(
          data['doctor_contact']!,
          _doctorContactMeta,
        ),
      );
    }
    if (data.containsKey('hospital')) {
      context.handle(
        _hospitalMeta,
        hospital.isAcceptableOrUnknown(data['hospital']!, _hospitalMeta),
      );
    }
    if (data.containsKey('visit_date')) {
      context.handle(
        _visitDateMeta,
        visitDate.isAcceptableOrUnknown(data['visit_date']!, _visitDateMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('follow_up_date')) {
      context.handle(
        _followUpDateMeta,
        followUpDate.isAcceptableOrUnknown(
          data['follow_up_date']!,
          _followUpDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoctorVisit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoctorVisit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      doctorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doctor_name'],
      )!,
      doctorContact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doctor_contact'],
      ),
      hospital: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hospital'],
      ),
      visitDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}visit_date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      followUpDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}follow_up_date'],
      ),
    );
  }

  @override
  $DoctorVisitsTable createAlias(String alias) {
    return $DoctorVisitsTable(attachedDatabase, alias);
  }
}

class DoctorVisit extends DataClass implements Insertable<DoctorVisit> {
  final int id;
  final int profileId;
  final String doctorName;
  final String? doctorContact;
  final String? hospital;
  final DateTime visitDate;
  final String? notes;
  final DateTime? followUpDate;
  const DoctorVisit({
    required this.id,
    required this.profileId,
    required this.doctorName,
    this.doctorContact,
    this.hospital,
    required this.visitDate,
    this.notes,
    this.followUpDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['doctor_name'] = Variable<String>(doctorName);
    if (!nullToAbsent || doctorContact != null) {
      map['doctor_contact'] = Variable<String>(doctorContact);
    }
    if (!nullToAbsent || hospital != null) {
      map['hospital'] = Variable<String>(hospital);
    }
    map['visit_date'] = Variable<DateTime>(visitDate);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || followUpDate != null) {
      map['follow_up_date'] = Variable<DateTime>(followUpDate);
    }
    return map;
  }

  DoctorVisitsCompanion toCompanion(bool nullToAbsent) {
    return DoctorVisitsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      doctorName: Value(doctorName),
      doctorContact: doctorContact == null && nullToAbsent
          ? const Value.absent()
          : Value(doctorContact),
      hospital: hospital == null && nullToAbsent
          ? const Value.absent()
          : Value(hospital),
      visitDate: Value(visitDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      followUpDate: followUpDate == null && nullToAbsent
          ? const Value.absent()
          : Value(followUpDate),
    );
  }

  factory DoctorVisit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoctorVisit(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      doctorName: serializer.fromJson<String>(json['doctorName']),
      doctorContact: serializer.fromJson<String?>(json['doctorContact']),
      hospital: serializer.fromJson<String?>(json['hospital']),
      visitDate: serializer.fromJson<DateTime>(json['visitDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      followUpDate: serializer.fromJson<DateTime?>(json['followUpDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'doctorName': serializer.toJson<String>(doctorName),
      'doctorContact': serializer.toJson<String?>(doctorContact),
      'hospital': serializer.toJson<String?>(hospital),
      'visitDate': serializer.toJson<DateTime>(visitDate),
      'notes': serializer.toJson<String?>(notes),
      'followUpDate': serializer.toJson<DateTime?>(followUpDate),
    };
  }

  DoctorVisit copyWith({
    int? id,
    int? profileId,
    String? doctorName,
    Value<String?> doctorContact = const Value.absent(),
    Value<String?> hospital = const Value.absent(),
    DateTime? visitDate,
    Value<String?> notes = const Value.absent(),
    Value<DateTime?> followUpDate = const Value.absent(),
  }) => DoctorVisit(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    doctorName: doctorName ?? this.doctorName,
    doctorContact: doctorContact.present
        ? doctorContact.value
        : this.doctorContact,
    hospital: hospital.present ? hospital.value : this.hospital,
    visitDate: visitDate ?? this.visitDate,
    notes: notes.present ? notes.value : this.notes,
    followUpDate: followUpDate.present ? followUpDate.value : this.followUpDate,
  );
  DoctorVisit copyWithCompanion(DoctorVisitsCompanion data) {
    return DoctorVisit(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      doctorName: data.doctorName.present
          ? data.doctorName.value
          : this.doctorName,
      doctorContact: data.doctorContact.present
          ? data.doctorContact.value
          : this.doctorContact,
      hospital: data.hospital.present ? data.hospital.value : this.hospital,
      visitDate: data.visitDate.present ? data.visitDate.value : this.visitDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      followUpDate: data.followUpDate.present
          ? data.followUpDate.value
          : this.followUpDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoctorVisit(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('doctorName: $doctorName, ')
          ..write('doctorContact: $doctorContact, ')
          ..write('hospital: $hospital, ')
          ..write('visitDate: $visitDate, ')
          ..write('notes: $notes, ')
          ..write('followUpDate: $followUpDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    doctorName,
    doctorContact,
    hospital,
    visitDate,
    notes,
    followUpDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoctorVisit &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.doctorName == this.doctorName &&
          other.doctorContact == this.doctorContact &&
          other.hospital == this.hospital &&
          other.visitDate == this.visitDate &&
          other.notes == this.notes &&
          other.followUpDate == this.followUpDate);
}

class DoctorVisitsCompanion extends UpdateCompanion<DoctorVisit> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> doctorName;
  final Value<String?> doctorContact;
  final Value<String?> hospital;
  final Value<DateTime> visitDate;
  final Value<String?> notes;
  final Value<DateTime?> followUpDate;
  const DoctorVisitsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.doctorContact = const Value.absent(),
    this.hospital = const Value.absent(),
    this.visitDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.followUpDate = const Value.absent(),
  });
  DoctorVisitsCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String doctorName,
    this.doctorContact = const Value.absent(),
    this.hospital = const Value.absent(),
    this.visitDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.followUpDate = const Value.absent(),
  }) : profileId = Value(profileId),
       doctorName = Value(doctorName);
  static Insertable<DoctorVisit> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? doctorName,
    Expression<String>? doctorContact,
    Expression<String>? hospital,
    Expression<DateTime>? visitDate,
    Expression<String>? notes,
    Expression<DateTime>? followUpDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (doctorName != null) 'doctor_name': doctorName,
      if (doctorContact != null) 'doctor_contact': doctorContact,
      if (hospital != null) 'hospital': hospital,
      if (visitDate != null) 'visit_date': visitDate,
      if (notes != null) 'notes': notes,
      if (followUpDate != null) 'follow_up_date': followUpDate,
    });
  }

  DoctorVisitsCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? doctorName,
    Value<String?>? doctorContact,
    Value<String?>? hospital,
    Value<DateTime>? visitDate,
    Value<String?>? notes,
    Value<DateTime?>? followUpDate,
  }) {
    return DoctorVisitsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      doctorName: doctorName ?? this.doctorName,
      doctorContact: doctorContact ?? this.doctorContact,
      hospital: hospital ?? this.hospital,
      visitDate: visitDate ?? this.visitDate,
      notes: notes ?? this.notes,
      followUpDate: followUpDate ?? this.followUpDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (doctorContact.present) {
      map['doctor_contact'] = Variable<String>(doctorContact.value);
    }
    if (hospital.present) {
      map['hospital'] = Variable<String>(hospital.value);
    }
    if (visitDate.present) {
      map['visit_date'] = Variable<DateTime>(visitDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (followUpDate.present) {
      map['follow_up_date'] = Variable<DateTime>(followUpDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoctorVisitsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('doctorName: $doctorName, ')
          ..write('doctorContact: $doctorContact, ')
          ..write('hospital: $hospital, ')
          ..write('visitDate: $visitDate, ')
          ..write('notes: $notes, ')
          ..write('followUpDate: $followUpDate')
          ..write(')'))
        .toString();
  }
}

class $PrescriptionsTable extends Prescriptions
    with TableInfo<$PrescriptionsTable, Prescription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrescriptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _visitIdMeta = const VerificationMeta(
    'visitId',
  );
  @override
  late final GeneratedColumn<int> visitId = GeneratedColumn<int>(
    'visit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES doctor_visits (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _medicineIdMeta = const VerificationMeta(
    'medicineId',
  );
  @override
  late final GeneratedColumn<int> medicineId = GeneratedColumn<int>(
    'medicine_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _medicineNameMeta = const VerificationMeta(
    'medicineName',
  );
  @override
  late final GeneratedColumn<String> medicineName = GeneratedColumn<String>(
    'medicine_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
    'dosage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<String> frequency = GeneratedColumn<String>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationDaysMeta = const VerificationMeta(
    'durationDays',
  );
  @override
  late final GeneratedColumn<int> durationDays = GeneratedColumn<int>(
    'duration_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    visitId,
    medicineId,
    medicineName,
    dosage,
    frequency,
    durationDays,
    notes,
    startDate,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prescriptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Prescription> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('visit_id')) {
      context.handle(
        _visitIdMeta,
        visitId.isAcceptableOrUnknown(data['visit_id']!, _visitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_visitIdMeta);
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
        _medicineIdMeta,
        medicineId.isAcceptableOrUnknown(data['medicine_id']!, _medicineIdMeta),
      );
    }
    if (data.containsKey('medicine_name')) {
      context.handle(
        _medicineNameMeta,
        medicineName.isAcceptableOrUnknown(
          data['medicine_name']!,
          _medicineNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicineNameMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(
        _dosageMeta,
        dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta),
      );
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('duration_days')) {
      context.handle(
        _durationDaysMeta,
        durationDays.isAcceptableOrUnknown(
          data['duration_days']!,
          _durationDaysMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Prescription map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Prescription(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      visitId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}visit_id'],
      )!,
      medicineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medicine_id'],
      ),
      medicineName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medicine_name'],
      )!,
      dosage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dosage'],
      )!,
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}frequency'],
      )!,
      durationDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_days'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $PrescriptionsTable createAlias(String alias) {
    return $PrescriptionsTable(attachedDatabase, alias);
  }
}

class Prescription extends DataClass implements Insertable<Prescription> {
  final int id;
  final int visitId;
  final int? medicineId;
  final String medicineName;
  final String dosage;
  final String frequency;
  final int? durationDays;
  final String? notes;
  final DateTime startDate;
  final bool isActive;
  const Prescription({
    required this.id,
    required this.visitId,
    this.medicineId,
    required this.medicineName,
    required this.dosage,
    required this.frequency,
    this.durationDays,
    this.notes,
    required this.startDate,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['visit_id'] = Variable<int>(visitId);
    if (!nullToAbsent || medicineId != null) {
      map['medicine_id'] = Variable<int>(medicineId);
    }
    map['medicine_name'] = Variable<String>(medicineName);
    map['dosage'] = Variable<String>(dosage);
    map['frequency'] = Variable<String>(frequency);
    if (!nullToAbsent || durationDays != null) {
      map['duration_days'] = Variable<int>(durationDays);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  PrescriptionsCompanion toCompanion(bool nullToAbsent) {
    return PrescriptionsCompanion(
      id: Value(id),
      visitId: Value(visitId),
      medicineId: medicineId == null && nullToAbsent
          ? const Value.absent()
          : Value(medicineId),
      medicineName: Value(medicineName),
      dosage: Value(dosage),
      frequency: Value(frequency),
      durationDays: durationDays == null && nullToAbsent
          ? const Value.absent()
          : Value(durationDays),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      startDate: Value(startDate),
      isActive: Value(isActive),
    );
  }

  factory Prescription.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Prescription(
      id: serializer.fromJson<int>(json['id']),
      visitId: serializer.fromJson<int>(json['visitId']),
      medicineId: serializer.fromJson<int?>(json['medicineId']),
      medicineName: serializer.fromJson<String>(json['medicineName']),
      dosage: serializer.fromJson<String>(json['dosage']),
      frequency: serializer.fromJson<String>(json['frequency']),
      durationDays: serializer.fromJson<int?>(json['durationDays']),
      notes: serializer.fromJson<String?>(json['notes']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'visitId': serializer.toJson<int>(visitId),
      'medicineId': serializer.toJson<int?>(medicineId),
      'medicineName': serializer.toJson<String>(medicineName),
      'dosage': serializer.toJson<String>(dosage),
      'frequency': serializer.toJson<String>(frequency),
      'durationDays': serializer.toJson<int?>(durationDays),
      'notes': serializer.toJson<String?>(notes),
      'startDate': serializer.toJson<DateTime>(startDate),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  Prescription copyWith({
    int? id,
    int? visitId,
    Value<int?> medicineId = const Value.absent(),
    String? medicineName,
    String? dosage,
    String? frequency,
    Value<int?> durationDays = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? startDate,
    bool? isActive,
  }) => Prescription(
    id: id ?? this.id,
    visitId: visitId ?? this.visitId,
    medicineId: medicineId.present ? medicineId.value : this.medicineId,
    medicineName: medicineName ?? this.medicineName,
    dosage: dosage ?? this.dosage,
    frequency: frequency ?? this.frequency,
    durationDays: durationDays.present ? durationDays.value : this.durationDays,
    notes: notes.present ? notes.value : this.notes,
    startDate: startDate ?? this.startDate,
    isActive: isActive ?? this.isActive,
  );
  Prescription copyWithCompanion(PrescriptionsCompanion data) {
    return Prescription(
      id: data.id.present ? data.id.value : this.id,
      visitId: data.visitId.present ? data.visitId.value : this.visitId,
      medicineId: data.medicineId.present
          ? data.medicineId.value
          : this.medicineId,
      medicineName: data.medicineName.present
          ? data.medicineName.value
          : this.medicineName,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      durationDays: data.durationDays.present
          ? data.durationDays.value
          : this.durationDays,
      notes: data.notes.present ? data.notes.value : this.notes,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Prescription(')
          ..write('id: $id, ')
          ..write('visitId: $visitId, ')
          ..write('medicineId: $medicineId, ')
          ..write('medicineName: $medicineName, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('durationDays: $durationDays, ')
          ..write('notes: $notes, ')
          ..write('startDate: $startDate, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    visitId,
    medicineId,
    medicineName,
    dosage,
    frequency,
    durationDays,
    notes,
    startDate,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Prescription &&
          other.id == this.id &&
          other.visitId == this.visitId &&
          other.medicineId == this.medicineId &&
          other.medicineName == this.medicineName &&
          other.dosage == this.dosage &&
          other.frequency == this.frequency &&
          other.durationDays == this.durationDays &&
          other.notes == this.notes &&
          other.startDate == this.startDate &&
          other.isActive == this.isActive);
}

class PrescriptionsCompanion extends UpdateCompanion<Prescription> {
  final Value<int> id;
  final Value<int> visitId;
  final Value<int?> medicineId;
  final Value<String> medicineName;
  final Value<String> dosage;
  final Value<String> frequency;
  final Value<int?> durationDays;
  final Value<String?> notes;
  final Value<DateTime> startDate;
  final Value<bool> isActive;
  const PrescriptionsCompanion({
    this.id = const Value.absent(),
    this.visitId = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.medicineName = const Value.absent(),
    this.dosage = const Value.absent(),
    this.frequency = const Value.absent(),
    this.durationDays = const Value.absent(),
    this.notes = const Value.absent(),
    this.startDate = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  PrescriptionsCompanion.insert({
    this.id = const Value.absent(),
    required int visitId,
    this.medicineId = const Value.absent(),
    required String medicineName,
    required String dosage,
    required String frequency,
    this.durationDays = const Value.absent(),
    this.notes = const Value.absent(),
    this.startDate = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : visitId = Value(visitId),
       medicineName = Value(medicineName),
       dosage = Value(dosage),
       frequency = Value(frequency);
  static Insertable<Prescription> custom({
    Expression<int>? id,
    Expression<int>? visitId,
    Expression<int>? medicineId,
    Expression<String>? medicineName,
    Expression<String>? dosage,
    Expression<String>? frequency,
    Expression<int>? durationDays,
    Expression<String>? notes,
    Expression<DateTime>? startDate,
    Expression<bool>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (visitId != null) 'visit_id': visitId,
      if (medicineId != null) 'medicine_id': medicineId,
      if (medicineName != null) 'medicine_name': medicineName,
      if (dosage != null) 'dosage': dosage,
      if (frequency != null) 'frequency': frequency,
      if (durationDays != null) 'duration_days': durationDays,
      if (notes != null) 'notes': notes,
      if (startDate != null) 'start_date': startDate,
      if (isActive != null) 'is_active': isActive,
    });
  }

  PrescriptionsCompanion copyWith({
    Value<int>? id,
    Value<int>? visitId,
    Value<int?>? medicineId,
    Value<String>? medicineName,
    Value<String>? dosage,
    Value<String>? frequency,
    Value<int?>? durationDays,
    Value<String?>? notes,
    Value<DateTime>? startDate,
    Value<bool>? isActive,
  }) {
    return PrescriptionsCompanion(
      id: id ?? this.id,
      visitId: visitId ?? this.visitId,
      medicineId: medicineId ?? this.medicineId,
      medicineName: medicineName ?? this.medicineName,
      dosage: dosage ?? this.dosage,
      frequency: frequency ?? this.frequency,
      durationDays: durationDays ?? this.durationDays,
      notes: notes ?? this.notes,
      startDate: startDate ?? this.startDate,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (visitId.present) {
      map['visit_id'] = Variable<int>(visitId.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<int>(medicineId.value);
    }
    if (medicineName.present) {
      map['medicine_name'] = Variable<String>(medicineName.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<String>(frequency.value);
    }
    if (durationDays.present) {
      map['duration_days'] = Variable<int>(durationDays.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrescriptionsCompanion(')
          ..write('id: $id, ')
          ..write('visitId: $visitId, ')
          ..write('medicineId: $medicineId, ')
          ..write('medicineName: $medicineName, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('durationDays: $durationDays, ')
          ..write('notes: $notes, ')
          ..write('startDate: $startDate, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $TestReportsTable extends TestReports
    with TableInfo<$TestReportsTable, TestReport> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestReportsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _visitIdMeta = const VerificationMeta(
    'visitId',
  );
  @override
  late final GeneratedColumn<int> visitId = GeneratedColumn<int>(
    'visit_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES doctor_visits (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _testNameMeta = const VerificationMeta(
    'testName',
  );
  @override
  late final GeneratedColumn<String> testName = GeneratedColumn<String>(
    'test_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
    'result',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _extractedTextMeta = const VerificationMeta(
    'extractedText',
  );
  @override
  late final GeneratedColumn<String> extractedText = GeneratedColumn<String>(
    'extracted_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    visitId,
    testName,
    date,
    result,
    notes,
    filePath,
    extractedText,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_reports';
  @override
  VerificationContext validateIntegrity(
    Insertable<TestReport> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('visit_id')) {
      context.handle(
        _visitIdMeta,
        visitId.isAcceptableOrUnknown(data['visit_id']!, _visitIdMeta),
      );
    }
    if (data.containsKey('test_name')) {
      context.handle(
        _testNameMeta,
        testName.isAcceptableOrUnknown(data['test_name']!, _testNameMeta),
      );
    } else if (isInserting) {
      context.missing(_testNameMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('result')) {
      context.handle(
        _resultMeta,
        result.isAcceptableOrUnknown(data['result']!, _resultMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    }
    if (data.containsKey('extracted_text')) {
      context.handle(
        _extractedTextMeta,
        extractedText.isAcceptableOrUnknown(
          data['extracted_text']!,
          _extractedTextMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestReport map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestReport(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      visitId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}visit_id'],
      ),
      testName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_name'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      result: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      extractedText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extracted_text'],
      ),
    );
  }

  @override
  $TestReportsTable createAlias(String alias) {
    return $TestReportsTable(attachedDatabase, alias);
  }
}

class TestReport extends DataClass implements Insertable<TestReport> {
  final int id;
  final int profileId;
  final int? visitId;
  final String testName;
  final DateTime date;
  final String? result;
  final String? notes;
  final String? filePath;
  final String? extractedText;
  const TestReport({
    required this.id,
    required this.profileId,
    this.visitId,
    required this.testName,
    required this.date,
    this.result,
    this.notes,
    this.filePath,
    this.extractedText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    if (!nullToAbsent || visitId != null) {
      map['visit_id'] = Variable<int>(visitId);
    }
    map['test_name'] = Variable<String>(testName);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    if (!nullToAbsent || extractedText != null) {
      map['extracted_text'] = Variable<String>(extractedText);
    }
    return map;
  }

  TestReportsCompanion toCompanion(bool nullToAbsent) {
    return TestReportsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      visitId: visitId == null && nullToAbsent
          ? const Value.absent()
          : Value(visitId),
      testName: Value(testName),
      date: Value(date),
      result: result == null && nullToAbsent
          ? const Value.absent()
          : Value(result),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      extractedText: extractedText == null && nullToAbsent
          ? const Value.absent()
          : Value(extractedText),
    );
  }

  factory TestReport.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestReport(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      visitId: serializer.fromJson<int?>(json['visitId']),
      testName: serializer.fromJson<String>(json['testName']),
      date: serializer.fromJson<DateTime>(json['date']),
      result: serializer.fromJson<String?>(json['result']),
      notes: serializer.fromJson<String?>(json['notes']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      extractedText: serializer.fromJson<String?>(json['extractedText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'visitId': serializer.toJson<int?>(visitId),
      'testName': serializer.toJson<String>(testName),
      'date': serializer.toJson<DateTime>(date),
      'result': serializer.toJson<String?>(result),
      'notes': serializer.toJson<String?>(notes),
      'filePath': serializer.toJson<String?>(filePath),
      'extractedText': serializer.toJson<String?>(extractedText),
    };
  }

  TestReport copyWith({
    int? id,
    int? profileId,
    Value<int?> visitId = const Value.absent(),
    String? testName,
    DateTime? date,
    Value<String?> result = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> filePath = const Value.absent(),
    Value<String?> extractedText = const Value.absent(),
  }) => TestReport(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    visitId: visitId.present ? visitId.value : this.visitId,
    testName: testName ?? this.testName,
    date: date ?? this.date,
    result: result.present ? result.value : this.result,
    notes: notes.present ? notes.value : this.notes,
    filePath: filePath.present ? filePath.value : this.filePath,
    extractedText: extractedText.present
        ? extractedText.value
        : this.extractedText,
  );
  TestReport copyWithCompanion(TestReportsCompanion data) {
    return TestReport(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      visitId: data.visitId.present ? data.visitId.value : this.visitId,
      testName: data.testName.present ? data.testName.value : this.testName,
      date: data.date.present ? data.date.value : this.date,
      result: data.result.present ? data.result.value : this.result,
      notes: data.notes.present ? data.notes.value : this.notes,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      extractedText: data.extractedText.present
          ? data.extractedText.value
          : this.extractedText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestReport(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('visitId: $visitId, ')
          ..write('testName: $testName, ')
          ..write('date: $date, ')
          ..write('result: $result, ')
          ..write('notes: $notes, ')
          ..write('filePath: $filePath, ')
          ..write('extractedText: $extractedText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    visitId,
    testName,
    date,
    result,
    notes,
    filePath,
    extractedText,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestReport &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.visitId == this.visitId &&
          other.testName == this.testName &&
          other.date == this.date &&
          other.result == this.result &&
          other.notes == this.notes &&
          other.filePath == this.filePath &&
          other.extractedText == this.extractedText);
}

class TestReportsCompanion extends UpdateCompanion<TestReport> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<int?> visitId;
  final Value<String> testName;
  final Value<DateTime> date;
  final Value<String?> result;
  final Value<String?> notes;
  final Value<String?> filePath;
  final Value<String?> extractedText;
  const TestReportsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.visitId = const Value.absent(),
    this.testName = const Value.absent(),
    this.date = const Value.absent(),
    this.result = const Value.absent(),
    this.notes = const Value.absent(),
    this.filePath = const Value.absent(),
    this.extractedText = const Value.absent(),
  });
  TestReportsCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    this.visitId = const Value.absent(),
    required String testName,
    this.date = const Value.absent(),
    this.result = const Value.absent(),
    this.notes = const Value.absent(),
    this.filePath = const Value.absent(),
    this.extractedText = const Value.absent(),
  }) : profileId = Value(profileId),
       testName = Value(testName);
  static Insertable<TestReport> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<int>? visitId,
    Expression<String>? testName,
    Expression<DateTime>? date,
    Expression<String>? result,
    Expression<String>? notes,
    Expression<String>? filePath,
    Expression<String>? extractedText,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (visitId != null) 'visit_id': visitId,
      if (testName != null) 'test_name': testName,
      if (date != null) 'date': date,
      if (result != null) 'result': result,
      if (notes != null) 'notes': notes,
      if (filePath != null) 'file_path': filePath,
      if (extractedText != null) 'extracted_text': extractedText,
    });
  }

  TestReportsCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<int?>? visitId,
    Value<String>? testName,
    Value<DateTime>? date,
    Value<String?>? result,
    Value<String?>? notes,
    Value<String?>? filePath,
    Value<String?>? extractedText,
  }) {
    return TestReportsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      visitId: visitId ?? this.visitId,
      testName: testName ?? this.testName,
      date: date ?? this.date,
      result: result ?? this.result,
      notes: notes ?? this.notes,
      filePath: filePath ?? this.filePath,
      extractedText: extractedText ?? this.extractedText,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (visitId.present) {
      map['visit_id'] = Variable<int>(visitId.value);
    }
    if (testName.present) {
      map['test_name'] = Variable<String>(testName.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (extractedText.present) {
      map['extracted_text'] = Variable<String>(extractedText.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestReportsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('visitId: $visitId, ')
          ..write('testName: $testName, ')
          ..write('date: $date, ')
          ..write('result: $result, ')
          ..write('notes: $notes, ')
          ..write('filePath: $filePath, ')
          ..write('extractedText: $extractedText')
          ..write(')'))
        .toString();
  }
}

class $VitalReadingsTable extends VitalReadings
    with TableInfo<$VitalReadingsTable, VitalReading> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VitalReadingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _value1Meta = const VerificationMeta('value1');
  @override
  late final GeneratedColumn<double> value1 = GeneratedColumn<double>(
    'value1',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _value2Meta = const VerificationMeta('value2');
  @override
  late final GeneratedColumn<double> value2 = GeneratedColumn<double>(
    'value2',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contextMeta = const VerificationMeta(
    'context',
  );
  @override
  late final GeneratedColumn<String> context = GeneratedColumn<String>(
    'context',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    type,
    unit,
    value1,
    value2,
    recordedAt,
    notes,
    context,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vital_readings';
  @override
  VerificationContext validateIntegrity(
    Insertable<VitalReading> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('value1')) {
      context.handle(
        _value1Meta,
        value1.isAcceptableOrUnknown(data['value1']!, _value1Meta),
      );
    } else if (isInserting) {
      context.missing(_value1Meta);
    }
    if (data.containsKey('value2')) {
      context.handle(
        _value2Meta,
        value2.isAcceptableOrUnknown(data['value2']!, _value2Meta),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('context')) {
      context.handle(
        _contextMeta,
        this.context.isAcceptableOrUnknown(data['context']!, _contextMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VitalReading map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VitalReading(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      ),
      value1: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value1'],
      )!,
      value2: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value2'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      context: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}context'],
      ),
    );
  }

  @override
  $VitalReadingsTable createAlias(String alias) {
    return $VitalReadingsTable(attachedDatabase, alias);
  }
}

class VitalReading extends DataClass implements Insertable<VitalReading> {
  final int id;
  final int profileId;
  final String type;
  final String? unit;
  final double value1;
  final double? value2;
  final DateTime recordedAt;
  final String? notes;
  final String? context;
  const VitalReading({
    required this.id,
    required this.profileId,
    required this.type,
    this.unit,
    required this.value1,
    this.value2,
    required this.recordedAt,
    this.notes,
    this.context,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    map['value1'] = Variable<double>(value1);
    if (!nullToAbsent || value2 != null) {
      map['value2'] = Variable<double>(value2);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || context != null) {
      map['context'] = Variable<String>(context);
    }
    return map;
  }

  VitalReadingsCompanion toCompanion(bool nullToAbsent) {
    return VitalReadingsCompanion(
      id: Value(id),
      profileId: Value(profileId),
      type: Value(type),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      value1: Value(value1),
      value2: value2 == null && nullToAbsent
          ? const Value.absent()
          : Value(value2),
      recordedAt: Value(recordedAt),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      context: context == null && nullToAbsent
          ? const Value.absent()
          : Value(context),
    );
  }

  factory VitalReading.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VitalReading(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      type: serializer.fromJson<String>(json['type']),
      unit: serializer.fromJson<String?>(json['unit']),
      value1: serializer.fromJson<double>(json['value1']),
      value2: serializer.fromJson<double?>(json['value2']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      notes: serializer.fromJson<String?>(json['notes']),
      context: serializer.fromJson<String?>(json['context']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'type': serializer.toJson<String>(type),
      'unit': serializer.toJson<String?>(unit),
      'value1': serializer.toJson<double>(value1),
      'value2': serializer.toJson<double?>(value2),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'notes': serializer.toJson<String?>(notes),
      'context': serializer.toJson<String?>(context),
    };
  }

  VitalReading copyWith({
    int? id,
    int? profileId,
    String? type,
    Value<String?> unit = const Value.absent(),
    double? value1,
    Value<double?> value2 = const Value.absent(),
    DateTime? recordedAt,
    Value<String?> notes = const Value.absent(),
    Value<String?> context = const Value.absent(),
  }) => VitalReading(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    type: type ?? this.type,
    unit: unit.present ? unit.value : this.unit,
    value1: value1 ?? this.value1,
    value2: value2.present ? value2.value : this.value2,
    recordedAt: recordedAt ?? this.recordedAt,
    notes: notes.present ? notes.value : this.notes,
    context: context.present ? context.value : this.context,
  );
  VitalReading copyWithCompanion(VitalReadingsCompanion data) {
    return VitalReading(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      type: data.type.present ? data.type.value : this.type,
      unit: data.unit.present ? data.unit.value : this.unit,
      value1: data.value1.present ? data.value1.value : this.value1,
      value2: data.value2.present ? data.value2.value : this.value2,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      context: data.context.present ? data.context.value : this.context,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VitalReading(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('type: $type, ')
          ..write('unit: $unit, ')
          ..write('value1: $value1, ')
          ..write('value2: $value2, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('notes: $notes, ')
          ..write('context: $context')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    type,
    unit,
    value1,
    value2,
    recordedAt,
    notes,
    context,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VitalReading &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.type == this.type &&
          other.unit == this.unit &&
          other.value1 == this.value1 &&
          other.value2 == this.value2 &&
          other.recordedAt == this.recordedAt &&
          other.notes == this.notes &&
          other.context == this.context);
}

class VitalReadingsCompanion extends UpdateCompanion<VitalReading> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> type;
  final Value<String?> unit;
  final Value<double> value1;
  final Value<double?> value2;
  final Value<DateTime> recordedAt;
  final Value<String?> notes;
  final Value<String?> context;
  const VitalReadingsCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.type = const Value.absent(),
    this.unit = const Value.absent(),
    this.value1 = const Value.absent(),
    this.value2 = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.context = const Value.absent(),
  });
  VitalReadingsCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String type,
    this.unit = const Value.absent(),
    required double value1,
    this.value2 = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.context = const Value.absent(),
  }) : profileId = Value(profileId),
       type = Value(type),
       value1 = Value(value1);
  static Insertable<VitalReading> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? type,
    Expression<String>? unit,
    Expression<double>? value1,
    Expression<double>? value2,
    Expression<DateTime>? recordedAt,
    Expression<String>? notes,
    Expression<String>? context,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (type != null) 'type': type,
      if (unit != null) 'unit': unit,
      if (value1 != null) 'value1': value1,
      if (value2 != null) 'value2': value2,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (notes != null) 'notes': notes,
      if (context != null) 'context': context,
    });
  }

  VitalReadingsCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? type,
    Value<String?>? unit,
    Value<double>? value1,
    Value<double?>? value2,
    Value<DateTime>? recordedAt,
    Value<String?>? notes,
    Value<String?>? context,
  }) {
    return VitalReadingsCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      type: type ?? this.type,
      unit: unit ?? this.unit,
      value1: value1 ?? this.value1,
      value2: value2 ?? this.value2,
      recordedAt: recordedAt ?? this.recordedAt,
      notes: notes ?? this.notes,
      context: context ?? this.context,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (value1.present) {
      map['value1'] = Variable<double>(value1.value);
    }
    if (value2.present) {
      map['value2'] = Variable<double>(value2.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (context.present) {
      map['context'] = Variable<String>(context.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VitalReadingsCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('type: $type, ')
          ..write('unit: $unit, ')
          ..write('value1: $value1, ')
          ..write('value2: $value2, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('notes: $notes, ')
          ..write('context: $context')
          ..write(')'))
        .toString();
  }
}

class $PeriodEntriesTable extends PeriodEntries
    with TableInfo<$PeriodEntriesTable, PeriodEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PeriodEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _flowIntensityMeta = const VerificationMeta(
    'flowIntensity',
  );
  @override
  late final GeneratedColumn<String> flowIntensity = GeneratedColumn<String>(
    'flow_intensity',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _symptomsMeta = const VerificationMeta(
    'symptoms',
  );
  @override
  late final GeneratedColumn<String> symptoms = GeneratedColumn<String>(
    'symptoms',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<String> mood = GeneratedColumn<String>(
    'mood',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPainfulMeta = const VerificationMeta(
    'isPainful',
  );
  @override
  late final GeneratedColumn<bool> isPainful = GeneratedColumn<bool>(
    'is_painful',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_painful" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isPredictionMeta = const VerificationMeta(
    'isPrediction',
  );
  @override
  late final GeneratedColumn<bool> isPrediction = GeneratedColumn<bool>(
    'is_prediction',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_prediction" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    startDate,
    endDate,
    flowIntensity,
    symptoms,
    notes,
    mood,
    isPainful,
    isPrediction,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'period_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<PeriodEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('flow_intensity')) {
      context.handle(
        _flowIntensityMeta,
        flowIntensity.isAcceptableOrUnknown(
          data['flow_intensity']!,
          _flowIntensityMeta,
        ),
      );
    }
    if (data.containsKey('symptoms')) {
      context.handle(
        _symptomsMeta,
        symptoms.isAcceptableOrUnknown(data['symptoms']!, _symptomsMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('mood')) {
      context.handle(
        _moodMeta,
        mood.isAcceptableOrUnknown(data['mood']!, _moodMeta),
      );
    }
    if (data.containsKey('is_painful')) {
      context.handle(
        _isPainfulMeta,
        isPainful.isAcceptableOrUnknown(data['is_painful']!, _isPainfulMeta),
      );
    }
    if (data.containsKey('is_prediction')) {
      context.handle(
        _isPredictionMeta,
        isPrediction.isAcceptableOrUnknown(
          data['is_prediction']!,
          _isPredictionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PeriodEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PeriodEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      flowIntensity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flow_intensity'],
      ),
      symptoms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symptoms'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      mood: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mood'],
      ),
      isPainful: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_painful'],
      )!,
      isPrediction: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_prediction'],
      )!,
    );
  }

  @override
  $PeriodEntriesTable createAlias(String alias) {
    return $PeriodEntriesTable(attachedDatabase, alias);
  }
}

class PeriodEntry extends DataClass implements Insertable<PeriodEntry> {
  final int id;
  final int profileId;
  final DateTime startDate;
  final DateTime? endDate;
  final String? flowIntensity;
  final String? symptoms;
  final String? notes;
  final String? mood;
  final bool isPainful;
  final bool isPrediction;
  const PeriodEntry({
    required this.id,
    required this.profileId,
    required this.startDate,
    this.endDate,
    this.flowIntensity,
    this.symptoms,
    this.notes,
    this.mood,
    required this.isPainful,
    required this.isPrediction,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || flowIntensity != null) {
      map['flow_intensity'] = Variable<String>(flowIntensity);
    }
    if (!nullToAbsent || symptoms != null) {
      map['symptoms'] = Variable<String>(symptoms);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<String>(mood);
    }
    map['is_painful'] = Variable<bool>(isPainful);
    map['is_prediction'] = Variable<bool>(isPrediction);
    return map;
  }

  PeriodEntriesCompanion toCompanion(bool nullToAbsent) {
    return PeriodEntriesCompanion(
      id: Value(id),
      profileId: Value(profileId),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      flowIntensity: flowIntensity == null && nullToAbsent
          ? const Value.absent()
          : Value(flowIntensity),
      symptoms: symptoms == null && nullToAbsent
          ? const Value.absent()
          : Value(symptoms),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      isPainful: Value(isPainful),
      isPrediction: Value(isPrediction),
    );
  }

  factory PeriodEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PeriodEntry(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      flowIntensity: serializer.fromJson<String?>(json['flowIntensity']),
      symptoms: serializer.fromJson<String?>(json['symptoms']),
      notes: serializer.fromJson<String?>(json['notes']),
      mood: serializer.fromJson<String?>(json['mood']),
      isPainful: serializer.fromJson<bool>(json['isPainful']),
      isPrediction: serializer.fromJson<bool>(json['isPrediction']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'flowIntensity': serializer.toJson<String?>(flowIntensity),
      'symptoms': serializer.toJson<String?>(symptoms),
      'notes': serializer.toJson<String?>(notes),
      'mood': serializer.toJson<String?>(mood),
      'isPainful': serializer.toJson<bool>(isPainful),
      'isPrediction': serializer.toJson<bool>(isPrediction),
    };
  }

  PeriodEntry copyWith({
    int? id,
    int? profileId,
    DateTime? startDate,
    Value<DateTime?> endDate = const Value.absent(),
    Value<String?> flowIntensity = const Value.absent(),
    Value<String?> symptoms = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> mood = const Value.absent(),
    bool? isPainful,
    bool? isPrediction,
  }) => PeriodEntry(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    startDate: startDate ?? this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    flowIntensity: flowIntensity.present
        ? flowIntensity.value
        : this.flowIntensity,
    symptoms: symptoms.present ? symptoms.value : this.symptoms,
    notes: notes.present ? notes.value : this.notes,
    mood: mood.present ? mood.value : this.mood,
    isPainful: isPainful ?? this.isPainful,
    isPrediction: isPrediction ?? this.isPrediction,
  );
  PeriodEntry copyWithCompanion(PeriodEntriesCompanion data) {
    return PeriodEntry(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      flowIntensity: data.flowIntensity.present
          ? data.flowIntensity.value
          : this.flowIntensity,
      symptoms: data.symptoms.present ? data.symptoms.value : this.symptoms,
      notes: data.notes.present ? data.notes.value : this.notes,
      mood: data.mood.present ? data.mood.value : this.mood,
      isPainful: data.isPainful.present ? data.isPainful.value : this.isPainful,
      isPrediction: data.isPrediction.present
          ? data.isPrediction.value
          : this.isPrediction,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PeriodEntry(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('flowIntensity: $flowIntensity, ')
          ..write('symptoms: $symptoms, ')
          ..write('notes: $notes, ')
          ..write('mood: $mood, ')
          ..write('isPainful: $isPainful, ')
          ..write('isPrediction: $isPrediction')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    startDate,
    endDate,
    flowIntensity,
    symptoms,
    notes,
    mood,
    isPainful,
    isPrediction,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PeriodEntry &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.flowIntensity == this.flowIntensity &&
          other.symptoms == this.symptoms &&
          other.notes == this.notes &&
          other.mood == this.mood &&
          other.isPainful == this.isPainful &&
          other.isPrediction == this.isPrediction);
}

class PeriodEntriesCompanion extends UpdateCompanion<PeriodEntry> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<String?> flowIntensity;
  final Value<String?> symptoms;
  final Value<String?> notes;
  final Value<String?> mood;
  final Value<bool> isPainful;
  final Value<bool> isPrediction;
  const PeriodEntriesCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.flowIntensity = const Value.absent(),
    this.symptoms = const Value.absent(),
    this.notes = const Value.absent(),
    this.mood = const Value.absent(),
    this.isPainful = const Value.absent(),
    this.isPrediction = const Value.absent(),
  });
  PeriodEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.flowIntensity = const Value.absent(),
    this.symptoms = const Value.absent(),
    this.notes = const Value.absent(),
    this.mood = const Value.absent(),
    this.isPainful = const Value.absent(),
    this.isPrediction = const Value.absent(),
  }) : profileId = Value(profileId),
       startDate = Value(startDate);
  static Insertable<PeriodEntry> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? flowIntensity,
    Expression<String>? symptoms,
    Expression<String>? notes,
    Expression<String>? mood,
    Expression<bool>? isPainful,
    Expression<bool>? isPrediction,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (flowIntensity != null) 'flow_intensity': flowIntensity,
      if (symptoms != null) 'symptoms': symptoms,
      if (notes != null) 'notes': notes,
      if (mood != null) 'mood': mood,
      if (isPainful != null) 'is_painful': isPainful,
      if (isPrediction != null) 'is_prediction': isPrediction,
    });
  }

  PeriodEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<DateTime>? startDate,
    Value<DateTime?>? endDate,
    Value<String?>? flowIntensity,
    Value<String?>? symptoms,
    Value<String?>? notes,
    Value<String?>? mood,
    Value<bool>? isPainful,
    Value<bool>? isPrediction,
  }) {
    return PeriodEntriesCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      flowIntensity: flowIntensity ?? this.flowIntensity,
      symptoms: symptoms ?? this.symptoms,
      notes: notes ?? this.notes,
      mood: mood ?? this.mood,
      isPainful: isPainful ?? this.isPainful,
      isPrediction: isPrediction ?? this.isPrediction,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (flowIntensity.present) {
      map['flow_intensity'] = Variable<String>(flowIntensity.value);
    }
    if (symptoms.present) {
      map['symptoms'] = Variable<String>(symptoms.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (mood.present) {
      map['mood'] = Variable<String>(mood.value);
    }
    if (isPainful.present) {
      map['is_painful'] = Variable<bool>(isPainful.value);
    }
    if (isPrediction.present) {
      map['is_prediction'] = Variable<bool>(isPrediction.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeriodEntriesCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('flowIntensity: $flowIntensity, ')
          ..write('symptoms: $symptoms, ')
          ..write('notes: $notes, ')
          ..write('mood: $mood, ')
          ..write('isPainful: $isPainful, ')
          ..write('isPrediction: $isPrediction')
          ..write(')'))
        .toString();
  }
}

class $InsurancesTable extends Insurances
    with TableInfo<$InsurancesTable, Insurance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InsurancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _providerNameMeta = const VerificationMeta(
    'providerName',
  );
  @override
  late final GeneratedColumn<String> providerName = GeneratedColumn<String>(
    'provider_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _policyNumberMeta = const VerificationMeta(
    'policyNumber',
  );
  @override
  late final GeneratedColumn<String> policyNumber = GeneratedColumn<String>(
    'policy_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _premiumAmountMeta = const VerificationMeta(
    'premiumAmount',
  );
  @override
  late final GeneratedColumn<double> premiumAmount = GeneratedColumn<double>(
    'premium_amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _premiumDueDateMeta = const VerificationMeta(
    'premiumDueDate',
  );
  @override
  late final GeneratedColumn<DateTime> premiumDueDate =
      GeneratedColumn<DateTime>(
        'premium_due_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _validUntilMeta = const VerificationMeta(
    'validUntil',
  );
  @override
  late final GeneratedColumn<DateTime> validUntil = GeneratedColumn<DateTime>(
    'valid_until',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _coverageDetailsMeta = const VerificationMeta(
    'coverageDetails',
  );
  @override
  late final GeneratedColumn<String> coverageDetails = GeneratedColumn<String>(
    'coverage_details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contactNumberMeta = const VerificationMeta(
    'contactNumber',
  );
  @override
  late final GeneratedColumn<String> contactNumber = GeneratedColumn<String>(
    'contact_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _policyDocumentPathMeta =
      const VerificationMeta('policyDocumentPath');
  @override
  late final GeneratedColumn<String> policyDocumentPath =
      GeneratedColumn<String>(
        'policy_document_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    providerName,
    policyNumber,
    premiumAmount,
    premiumDueDate,
    validUntil,
    coverageDetails,
    contactNumber,
    notes,
    policyDocumentPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'insurances';
  @override
  VerificationContext validateIntegrity(
    Insertable<Insurance> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('provider_name')) {
      context.handle(
        _providerNameMeta,
        providerName.isAcceptableOrUnknown(
          data['provider_name']!,
          _providerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_providerNameMeta);
    }
    if (data.containsKey('policy_number')) {
      context.handle(
        _policyNumberMeta,
        policyNumber.isAcceptableOrUnknown(
          data['policy_number']!,
          _policyNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_policyNumberMeta);
    }
    if (data.containsKey('premium_amount')) {
      context.handle(
        _premiumAmountMeta,
        premiumAmount.isAcceptableOrUnknown(
          data['premium_amount']!,
          _premiumAmountMeta,
        ),
      );
    }
    if (data.containsKey('premium_due_date')) {
      context.handle(
        _premiumDueDateMeta,
        premiumDueDate.isAcceptableOrUnknown(
          data['premium_due_date']!,
          _premiumDueDateMeta,
        ),
      );
    }
    if (data.containsKey('valid_until')) {
      context.handle(
        _validUntilMeta,
        validUntil.isAcceptableOrUnknown(data['valid_until']!, _validUntilMeta),
      );
    }
    if (data.containsKey('coverage_details')) {
      context.handle(
        _coverageDetailsMeta,
        coverageDetails.isAcceptableOrUnknown(
          data['coverage_details']!,
          _coverageDetailsMeta,
        ),
      );
    }
    if (data.containsKey('contact_number')) {
      context.handle(
        _contactNumberMeta,
        contactNumber.isAcceptableOrUnknown(
          data['contact_number']!,
          _contactNumberMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('policy_document_path')) {
      context.handle(
        _policyDocumentPathMeta,
        policyDocumentPath.isAcceptableOrUnknown(
          data['policy_document_path']!,
          _policyDocumentPathMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Insurance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Insurance(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      providerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}provider_name'],
      )!,
      policyNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}policy_number'],
      )!,
      premiumAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}premium_amount'],
      ),
      premiumDueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}premium_due_date'],
      ),
      validUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}valid_until'],
      ),
      coverageDetails: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}coverage_details'],
      ),
      contactNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_number'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      policyDocumentPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}policy_document_path'],
      ),
    );
  }

  @override
  $InsurancesTable createAlias(String alias) {
    return $InsurancesTable(attachedDatabase, alias);
  }
}

class Insurance extends DataClass implements Insertable<Insurance> {
  final int id;
  final int profileId;
  final String providerName;
  final String policyNumber;
  final double? premiumAmount;
  final DateTime? premiumDueDate;
  final DateTime? validUntil;
  final String? coverageDetails;
  final String? contactNumber;
  final String? notes;
  final String? policyDocumentPath;
  const Insurance({
    required this.id,
    required this.profileId,
    required this.providerName,
    required this.policyNumber,
    this.premiumAmount,
    this.premiumDueDate,
    this.validUntil,
    this.coverageDetails,
    this.contactNumber,
    this.notes,
    this.policyDocumentPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['provider_name'] = Variable<String>(providerName);
    map['policy_number'] = Variable<String>(policyNumber);
    if (!nullToAbsent || premiumAmount != null) {
      map['premium_amount'] = Variable<double>(premiumAmount);
    }
    if (!nullToAbsent || premiumDueDate != null) {
      map['premium_due_date'] = Variable<DateTime>(premiumDueDate);
    }
    if (!nullToAbsent || validUntil != null) {
      map['valid_until'] = Variable<DateTime>(validUntil);
    }
    if (!nullToAbsent || coverageDetails != null) {
      map['coverage_details'] = Variable<String>(coverageDetails);
    }
    if (!nullToAbsent || contactNumber != null) {
      map['contact_number'] = Variable<String>(contactNumber);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || policyDocumentPath != null) {
      map['policy_document_path'] = Variable<String>(policyDocumentPath);
    }
    return map;
  }

  InsurancesCompanion toCompanion(bool nullToAbsent) {
    return InsurancesCompanion(
      id: Value(id),
      profileId: Value(profileId),
      providerName: Value(providerName),
      policyNumber: Value(policyNumber),
      premiumAmount: premiumAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(premiumAmount),
      premiumDueDate: premiumDueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(premiumDueDate),
      validUntil: validUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(validUntil),
      coverageDetails: coverageDetails == null && nullToAbsent
          ? const Value.absent()
          : Value(coverageDetails),
      contactNumber: contactNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(contactNumber),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      policyDocumentPath: policyDocumentPath == null && nullToAbsent
          ? const Value.absent()
          : Value(policyDocumentPath),
    );
  }

  factory Insurance.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Insurance(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      providerName: serializer.fromJson<String>(json['providerName']),
      policyNumber: serializer.fromJson<String>(json['policyNumber']),
      premiumAmount: serializer.fromJson<double?>(json['premiumAmount']),
      premiumDueDate: serializer.fromJson<DateTime?>(json['premiumDueDate']),
      validUntil: serializer.fromJson<DateTime?>(json['validUntil']),
      coverageDetails: serializer.fromJson<String?>(json['coverageDetails']),
      contactNumber: serializer.fromJson<String?>(json['contactNumber']),
      notes: serializer.fromJson<String?>(json['notes']),
      policyDocumentPath: serializer.fromJson<String?>(
        json['policyDocumentPath'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'providerName': serializer.toJson<String>(providerName),
      'policyNumber': serializer.toJson<String>(policyNumber),
      'premiumAmount': serializer.toJson<double?>(premiumAmount),
      'premiumDueDate': serializer.toJson<DateTime?>(premiumDueDate),
      'validUntil': serializer.toJson<DateTime?>(validUntil),
      'coverageDetails': serializer.toJson<String?>(coverageDetails),
      'contactNumber': serializer.toJson<String?>(contactNumber),
      'notes': serializer.toJson<String?>(notes),
      'policyDocumentPath': serializer.toJson<String?>(policyDocumentPath),
    };
  }

  Insurance copyWith({
    int? id,
    int? profileId,
    String? providerName,
    String? policyNumber,
    Value<double?> premiumAmount = const Value.absent(),
    Value<DateTime?> premiumDueDate = const Value.absent(),
    Value<DateTime?> validUntil = const Value.absent(),
    Value<String?> coverageDetails = const Value.absent(),
    Value<String?> contactNumber = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> policyDocumentPath = const Value.absent(),
  }) => Insurance(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    providerName: providerName ?? this.providerName,
    policyNumber: policyNumber ?? this.policyNumber,
    premiumAmount: premiumAmount.present
        ? premiumAmount.value
        : this.premiumAmount,
    premiumDueDate: premiumDueDate.present
        ? premiumDueDate.value
        : this.premiumDueDate,
    validUntil: validUntil.present ? validUntil.value : this.validUntil,
    coverageDetails: coverageDetails.present
        ? coverageDetails.value
        : this.coverageDetails,
    contactNumber: contactNumber.present
        ? contactNumber.value
        : this.contactNumber,
    notes: notes.present ? notes.value : this.notes,
    policyDocumentPath: policyDocumentPath.present
        ? policyDocumentPath.value
        : this.policyDocumentPath,
  );
  Insurance copyWithCompanion(InsurancesCompanion data) {
    return Insurance(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      providerName: data.providerName.present
          ? data.providerName.value
          : this.providerName,
      policyNumber: data.policyNumber.present
          ? data.policyNumber.value
          : this.policyNumber,
      premiumAmount: data.premiumAmount.present
          ? data.premiumAmount.value
          : this.premiumAmount,
      premiumDueDate: data.premiumDueDate.present
          ? data.premiumDueDate.value
          : this.premiumDueDate,
      validUntil: data.validUntil.present
          ? data.validUntil.value
          : this.validUntil,
      coverageDetails: data.coverageDetails.present
          ? data.coverageDetails.value
          : this.coverageDetails,
      contactNumber: data.contactNumber.present
          ? data.contactNumber.value
          : this.contactNumber,
      notes: data.notes.present ? data.notes.value : this.notes,
      policyDocumentPath: data.policyDocumentPath.present
          ? data.policyDocumentPath.value
          : this.policyDocumentPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Insurance(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('providerName: $providerName, ')
          ..write('policyNumber: $policyNumber, ')
          ..write('premiumAmount: $premiumAmount, ')
          ..write('premiumDueDate: $premiumDueDate, ')
          ..write('validUntil: $validUntil, ')
          ..write('coverageDetails: $coverageDetails, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('notes: $notes, ')
          ..write('policyDocumentPath: $policyDocumentPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    providerName,
    policyNumber,
    premiumAmount,
    premiumDueDate,
    validUntil,
    coverageDetails,
    contactNumber,
    notes,
    policyDocumentPath,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Insurance &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.providerName == this.providerName &&
          other.policyNumber == this.policyNumber &&
          other.premiumAmount == this.premiumAmount &&
          other.premiumDueDate == this.premiumDueDate &&
          other.validUntil == this.validUntil &&
          other.coverageDetails == this.coverageDetails &&
          other.contactNumber == this.contactNumber &&
          other.notes == this.notes &&
          other.policyDocumentPath == this.policyDocumentPath);
}

class InsurancesCompanion extends UpdateCompanion<Insurance> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> providerName;
  final Value<String> policyNumber;
  final Value<double?> premiumAmount;
  final Value<DateTime?> premiumDueDate;
  final Value<DateTime?> validUntil;
  final Value<String?> coverageDetails;
  final Value<String?> contactNumber;
  final Value<String?> notes;
  final Value<String?> policyDocumentPath;
  const InsurancesCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.providerName = const Value.absent(),
    this.policyNumber = const Value.absent(),
    this.premiumAmount = const Value.absent(),
    this.premiumDueDate = const Value.absent(),
    this.validUntil = const Value.absent(),
    this.coverageDetails = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.policyDocumentPath = const Value.absent(),
  });
  InsurancesCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String providerName,
    required String policyNumber,
    this.premiumAmount = const Value.absent(),
    this.premiumDueDate = const Value.absent(),
    this.validUntil = const Value.absent(),
    this.coverageDetails = const Value.absent(),
    this.contactNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.policyDocumentPath = const Value.absent(),
  }) : profileId = Value(profileId),
       providerName = Value(providerName),
       policyNumber = Value(policyNumber);
  static Insertable<Insurance> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? providerName,
    Expression<String>? policyNumber,
    Expression<double>? premiumAmount,
    Expression<DateTime>? premiumDueDate,
    Expression<DateTime>? validUntil,
    Expression<String>? coverageDetails,
    Expression<String>? contactNumber,
    Expression<String>? notes,
    Expression<String>? policyDocumentPath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (providerName != null) 'provider_name': providerName,
      if (policyNumber != null) 'policy_number': policyNumber,
      if (premiumAmount != null) 'premium_amount': premiumAmount,
      if (premiumDueDate != null) 'premium_due_date': premiumDueDate,
      if (validUntil != null) 'valid_until': validUntil,
      if (coverageDetails != null) 'coverage_details': coverageDetails,
      if (contactNumber != null) 'contact_number': contactNumber,
      if (notes != null) 'notes': notes,
      if (policyDocumentPath != null)
        'policy_document_path': policyDocumentPath,
    });
  }

  InsurancesCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? providerName,
    Value<String>? policyNumber,
    Value<double?>? premiumAmount,
    Value<DateTime?>? premiumDueDate,
    Value<DateTime?>? validUntil,
    Value<String?>? coverageDetails,
    Value<String?>? contactNumber,
    Value<String?>? notes,
    Value<String?>? policyDocumentPath,
  }) {
    return InsurancesCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      providerName: providerName ?? this.providerName,
      policyNumber: policyNumber ?? this.policyNumber,
      premiumAmount: premiumAmount ?? this.premiumAmount,
      premiumDueDate: premiumDueDate ?? this.premiumDueDate,
      validUntil: validUntil ?? this.validUntil,
      coverageDetails: coverageDetails ?? this.coverageDetails,
      contactNumber: contactNumber ?? this.contactNumber,
      notes: notes ?? this.notes,
      policyDocumentPath: policyDocumentPath ?? this.policyDocumentPath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (providerName.present) {
      map['provider_name'] = Variable<String>(providerName.value);
    }
    if (policyNumber.present) {
      map['policy_number'] = Variable<String>(policyNumber.value);
    }
    if (premiumAmount.present) {
      map['premium_amount'] = Variable<double>(premiumAmount.value);
    }
    if (premiumDueDate.present) {
      map['premium_due_date'] = Variable<DateTime>(premiumDueDate.value);
    }
    if (validUntil.present) {
      map['valid_until'] = Variable<DateTime>(validUntil.value);
    }
    if (coverageDetails.present) {
      map['coverage_details'] = Variable<String>(coverageDetails.value);
    }
    if (contactNumber.present) {
      map['contact_number'] = Variable<String>(contactNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (policyDocumentPath.present) {
      map['policy_document_path'] = Variable<String>(policyDocumentPath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InsurancesCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('providerName: $providerName, ')
          ..write('policyNumber: $policyNumber, ')
          ..write('premiumAmount: $premiumAmount, ')
          ..write('premiumDueDate: $premiumDueDate, ')
          ..write('validUntil: $validUntil, ')
          ..write('coverageDetails: $coverageDetails, ')
          ..write('contactNumber: $contactNumber, ')
          ..write('notes: $notes, ')
          ..write('policyDocumentPath: $policyDocumentPath')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, Reminder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _profileIdMeta = const VerificationMeta(
    'profileId',
  );
  @override
  late final GeneratedColumn<int> profileId = GeneratedColumn<int>(
    'profile_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES profiles (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _repeatPatternMeta = const VerificationMeta(
    'repeatPattern',
  );
  @override
  late final GeneratedColumn<String> repeatPattern = GeneratedColumn<String>(
    'repeat_pattern',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    profileId,
    type,
    title,
    description,
    scheduledAt,
    repeatPattern,
    isActive,
    entityId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reminder> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('profile_id')) {
      context.handle(
        _profileIdMeta,
        profileId.isAcceptableOrUnknown(data['profile_id']!, _profileIdMeta),
      );
    } else if (isInserting) {
      context.missing(_profileIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('repeat_pattern')) {
      context.handle(
        _repeatPatternMeta,
        repeatPattern.isAcceptableOrUnknown(
          data['repeat_pattern']!,
          _repeatPatternMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reminder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reminder(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      profileId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}profile_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      repeatPattern: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}repeat_pattern'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
      ),
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class Reminder extends DataClass implements Insertable<Reminder> {
  final int id;
  final int profileId;
  final String type;
  final String title;
  final String? description;
  final DateTime scheduledAt;
  final String? repeatPattern;
  final bool isActive;
  final int? entityId;
  const Reminder({
    required this.id,
    required this.profileId,
    required this.type,
    required this.title,
    this.description,
    required this.scheduledAt,
    this.repeatPattern,
    required this.isActive,
    this.entityId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['profile_id'] = Variable<int>(profileId);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    if (!nullToAbsent || repeatPattern != null) {
      map['repeat_pattern'] = Variable<String>(repeatPattern);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<int>(entityId);
    }
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      profileId: Value(profileId),
      type: Value(type),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      scheduledAt: Value(scheduledAt),
      repeatPattern: repeatPattern == null && nullToAbsent
          ? const Value.absent()
          : Value(repeatPattern),
      isActive: Value(isActive),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
    );
  }

  factory Reminder.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reminder(
      id: serializer.fromJson<int>(json['id']),
      profileId: serializer.fromJson<int>(json['profileId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      repeatPattern: serializer.fromJson<String?>(json['repeatPattern']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      entityId: serializer.fromJson<int?>(json['entityId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'profileId': serializer.toJson<int>(profileId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'repeatPattern': serializer.toJson<String?>(repeatPattern),
      'isActive': serializer.toJson<bool>(isActive),
      'entityId': serializer.toJson<int?>(entityId),
    };
  }

  Reminder copyWith({
    int? id,
    int? profileId,
    String? type,
    String? title,
    Value<String?> description = const Value.absent(),
    DateTime? scheduledAt,
    Value<String?> repeatPattern = const Value.absent(),
    bool? isActive,
    Value<int?> entityId = const Value.absent(),
  }) => Reminder(
    id: id ?? this.id,
    profileId: profileId ?? this.profileId,
    type: type ?? this.type,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    repeatPattern: repeatPattern.present
        ? repeatPattern.value
        : this.repeatPattern,
    isActive: isActive ?? this.isActive,
    entityId: entityId.present ? entityId.value : this.entityId,
  );
  Reminder copyWithCompanion(RemindersCompanion data) {
    return Reminder(
      id: data.id.present ? data.id.value : this.id,
      profileId: data.profileId.present ? data.profileId.value : this.profileId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      repeatPattern: data.repeatPattern.present
          ? data.repeatPattern.value
          : this.repeatPattern,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reminder(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('repeatPattern: $repeatPattern, ')
          ..write('isActive: $isActive, ')
          ..write('entityId: $entityId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    profileId,
    type,
    title,
    description,
    scheduledAt,
    repeatPattern,
    isActive,
    entityId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reminder &&
          other.id == this.id &&
          other.profileId == this.profileId &&
          other.type == this.type &&
          other.title == this.title &&
          other.description == this.description &&
          other.scheduledAt == this.scheduledAt &&
          other.repeatPattern == this.repeatPattern &&
          other.isActive == this.isActive &&
          other.entityId == this.entityId);
}

class RemindersCompanion extends UpdateCompanion<Reminder> {
  final Value<int> id;
  final Value<int> profileId;
  final Value<String> type;
  final Value<String> title;
  final Value<String?> description;
  final Value<DateTime> scheduledAt;
  final Value<String?> repeatPattern;
  final Value<bool> isActive;
  final Value<int?> entityId;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.profileId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.repeatPattern = const Value.absent(),
    this.isActive = const Value.absent(),
    this.entityId = const Value.absent(),
  });
  RemindersCompanion.insert({
    this.id = const Value.absent(),
    required int profileId,
    required String type,
    required String title,
    this.description = const Value.absent(),
    required DateTime scheduledAt,
    this.repeatPattern = const Value.absent(),
    this.isActive = const Value.absent(),
    this.entityId = const Value.absent(),
  }) : profileId = Value(profileId),
       type = Value(type),
       title = Value(title),
       scheduledAt = Value(scheduledAt);
  static Insertable<Reminder> custom({
    Expression<int>? id,
    Expression<int>? profileId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? description,
    Expression<DateTime>? scheduledAt,
    Expression<String>? repeatPattern,
    Expression<bool>? isActive,
    Expression<int>? entityId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (profileId != null) 'profile_id': profileId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (repeatPattern != null) 'repeat_pattern': repeatPattern,
      if (isActive != null) 'is_active': isActive,
      if (entityId != null) 'entity_id': entityId,
    });
  }

  RemindersCompanion copyWith({
    Value<int>? id,
    Value<int>? profileId,
    Value<String>? type,
    Value<String>? title,
    Value<String?>? description,
    Value<DateTime>? scheduledAt,
    Value<String?>? repeatPattern,
    Value<bool>? isActive,
    Value<int?>? entityId,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      repeatPattern: repeatPattern ?? this.repeatPattern,
      isActive: isActive ?? this.isActive,
      entityId: entityId ?? this.entityId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (profileId.present) {
      map['profile_id'] = Variable<int>(profileId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (repeatPattern.present) {
      map['repeat_pattern'] = Variable<String>(repeatPattern.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('profileId: $profileId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('repeatPattern: $repeatPattern, ')
          ..write('isActive: $isActive, ')
          ..write('entityId: $entityId')
          ..write(')'))
        .toString();
  }
}

class $HealthTipsTable extends HealthTips
    with TableInfo<$HealthTipsTable, HealthTip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthTipsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, category, title, content, source];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'health_tips';
  @override
  VerificationContext validateIntegrity(
    Insertable<HealthTip> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HealthTip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthTip(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $HealthTipsTable createAlias(String alias) {
    return $HealthTipsTable(attachedDatabase, alias);
  }
}

class HealthTip extends DataClass implements Insertable<HealthTip> {
  final int id;
  final String category;
  final String title;
  final String content;
  final String source;
  const HealthTip({
    required this.id,
    required this.category,
    required this.title,
    required this.content,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<String>(category);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['source'] = Variable<String>(source);
    return map;
  }

  HealthTipsCompanion toCompanion(bool nullToAbsent) {
    return HealthTipsCompanion(
      id: Value(id),
      category: Value(category),
      title: Value(title),
      content: Value(content),
      source: Value(source),
    );
  }

  factory HealthTip.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthTip(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String>(category),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'source': serializer.toJson<String>(source),
    };
  }

  HealthTip copyWith({
    int? id,
    String? category,
    String? title,
    String? content,
    String? source,
  }) => HealthTip(
    id: id ?? this.id,
    category: category ?? this.category,
    title: title ?? this.title,
    content: content ?? this.content,
    source: source ?? this.source,
  );
  HealthTip copyWithCompanion(HealthTipsCompanion data) {
    return HealthTip(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthTip(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, category, title, content, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthTip &&
          other.id == this.id &&
          other.category == this.category &&
          other.title == this.title &&
          other.content == this.content &&
          other.source == this.source);
}

class HealthTipsCompanion extends UpdateCompanion<HealthTip> {
  final Value<int> id;
  final Value<String> category;
  final Value<String> title;
  final Value<String> content;
  final Value<String> source;
  const HealthTipsCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.source = const Value.absent(),
  });
  HealthTipsCompanion.insert({
    this.id = const Value.absent(),
    required String category,
    required String title,
    required String content,
    required String source,
  }) : category = Value(category),
       title = Value(title),
       content = Value(content),
       source = Value(source);
  static Insertable<HealthTip> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? source,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (source != null) 'source': source,
    });
  }

  HealthTipsCompanion copyWith({
    Value<int>? id,
    Value<String>? category,
    Value<String>? title,
    Value<String>? content,
    Value<String>? source,
  }) {
    return HealthTipsCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
      content: content ?? this.content,
      source: source ?? this.source,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthTipsCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $HealthConditionsTable healthConditions = $HealthConditionsTable(
    this,
  );
  late final $DoctorVisitsTable doctorVisits = $DoctorVisitsTable(this);
  late final $PrescriptionsTable prescriptions = $PrescriptionsTable(this);
  late final $TestReportsTable testReports = $TestReportsTable(this);
  late final $VitalReadingsTable vitalReadings = $VitalReadingsTable(this);
  late final $PeriodEntriesTable periodEntries = $PeriodEntriesTable(this);
  late final $InsurancesTable insurances = $InsurancesTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $HealthTipsTable healthTips = $HealthTipsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    profiles,
    healthConditions,
    doctorVisits,
    prescriptions,
    testReports,
    vitalReadings,
    periodEntries,
    insurances,
    reminders,
    healthTips,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('health_conditions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('doctor_visits', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'doctor_visits',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('prescriptions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('test_reports', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'doctor_visits',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('test_reports', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('vital_readings', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('period_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('insurances', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'profiles',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reminders', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$ProfilesTableCreateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      required String name,
      required int age,
      required String sex,
      required String emoji,
      Value<DateTime> createdAt,
    });
typedef $$ProfilesTableUpdateCompanionBuilder =
    ProfilesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> age,
      Value<String> sex,
      Value<String> emoji,
      Value<DateTime> createdAt,
    });

final class $$ProfilesTableReferences
    extends BaseReferences<_$AppDatabase, $ProfilesTable, Profile> {
  $$ProfilesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HealthConditionsTable, List<HealthCondition>>
  _healthConditionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.healthConditions,
    aliasName: $_aliasNameGenerator(
      db.profiles.id,
      db.healthConditions.profileId,
    ),
  );

  $$HealthConditionsTableProcessedTableManager get healthConditionsRefs {
    final manager = $$HealthConditionsTableTableManager(
      $_db,
      $_db.healthConditions,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _healthConditionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DoctorVisitsTable, List<DoctorVisit>>
  _doctorVisitsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.doctorVisits,
    aliasName: $_aliasNameGenerator(db.profiles.id, db.doctorVisits.profileId),
  );

  $$DoctorVisitsTableProcessedTableManager get doctorVisitsRefs {
    final manager = $$DoctorVisitsTableTableManager(
      $_db,
      $_db.doctorVisits,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_doctorVisitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TestReportsTable, List<TestReport>>
  _testReportsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.testReports,
    aliasName: $_aliasNameGenerator(db.profiles.id, db.testReports.profileId),
  );

  $$TestReportsTableProcessedTableManager get testReportsRefs {
    final manager = $$TestReportsTableTableManager(
      $_db,
      $_db.testReports,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_testReportsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VitalReadingsTable, List<VitalReading>>
  _vitalReadingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vitalReadings,
    aliasName: $_aliasNameGenerator(db.profiles.id, db.vitalReadings.profileId),
  );

  $$VitalReadingsTableProcessedTableManager get vitalReadingsRefs {
    final manager = $$VitalReadingsTableTableManager(
      $_db,
      $_db.vitalReadings,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vitalReadingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PeriodEntriesTable, List<PeriodEntry>>
  _periodEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.periodEntries,
    aliasName: $_aliasNameGenerator(db.profiles.id, db.periodEntries.profileId),
  );

  $$PeriodEntriesTableProcessedTableManager get periodEntriesRefs {
    final manager = $$PeriodEntriesTableTableManager(
      $_db,
      $_db.periodEntries,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_periodEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InsurancesTable, List<Insurance>>
  _insurancesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.insurances,
    aliasName: $_aliasNameGenerator(db.profiles.id, db.insurances.profileId),
  );

  $$InsurancesTableProcessedTableManager get insurancesRefs {
    final manager = $$InsurancesTableTableManager(
      $_db,
      $_db.insurances,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_insurancesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RemindersTable, List<Reminder>>
  _remindersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reminders,
    aliasName: $_aliasNameGenerator(db.profiles.id, db.reminders.profileId),
  );

  $$RemindersTableProcessedTableManager get remindersRefs {
    final manager = $$RemindersTableTableManager(
      $_db,
      $_db.reminders,
    ).filter((f) => f.profileId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> healthConditionsRefs(
    Expression<bool> Function($$HealthConditionsTableFilterComposer f) f,
  ) {
    final $$HealthConditionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.healthConditions,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthConditionsTableFilterComposer(
            $db: $db,
            $table: $db.healthConditions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> doctorVisitsRefs(
    Expression<bool> Function($$DoctorVisitsTableFilterComposer f) f,
  ) {
    final $$DoctorVisitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doctorVisits,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorVisitsTableFilterComposer(
            $db: $db,
            $table: $db.doctorVisits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> testReportsRefs(
    Expression<bool> Function($$TestReportsTableFilterComposer f) f,
  ) {
    final $$TestReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testReports,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestReportsTableFilterComposer(
            $db: $db,
            $table: $db.testReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> vitalReadingsRefs(
    Expression<bool> Function($$VitalReadingsTableFilterComposer f) f,
  ) {
    final $$VitalReadingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vitalReadings,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VitalReadingsTableFilterComposer(
            $db: $db,
            $table: $db.vitalReadings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> periodEntriesRefs(
    Expression<bool> Function($$PeriodEntriesTableFilterComposer f) f,
  ) {
    final $$PeriodEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.periodEntries,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeriodEntriesTableFilterComposer(
            $db: $db,
            $table: $db.periodEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> insurancesRefs(
    Expression<bool> Function($$InsurancesTableFilterComposer f) f,
  ) {
    final $$InsurancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.insurances,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsurancesTableFilterComposer(
            $db: $db,
            $table: $db.insurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> remindersRefs(
    Expression<bool> Function($$RemindersTableFilterComposer f) f,
  ) {
    final $$RemindersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableFilterComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sex => $composableBuilder(
    column: $table.sex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get sex =>
      $composableBuilder(column: $table.sex, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> healthConditionsRefs<T extends Object>(
    Expression<T> Function($$HealthConditionsTableAnnotationComposer a) f,
  ) {
    final $$HealthConditionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.healthConditions,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthConditionsTableAnnotationComposer(
            $db: $db,
            $table: $db.healthConditions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> doctorVisitsRefs<T extends Object>(
    Expression<T> Function($$DoctorVisitsTableAnnotationComposer a) f,
  ) {
    final $$DoctorVisitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doctorVisits,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorVisitsTableAnnotationComposer(
            $db: $db,
            $table: $db.doctorVisits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> testReportsRefs<T extends Object>(
    Expression<T> Function($$TestReportsTableAnnotationComposer a) f,
  ) {
    final $$TestReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testReports,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.testReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> vitalReadingsRefs<T extends Object>(
    Expression<T> Function($$VitalReadingsTableAnnotationComposer a) f,
  ) {
    final $$VitalReadingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vitalReadings,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VitalReadingsTableAnnotationComposer(
            $db: $db,
            $table: $db.vitalReadings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> periodEntriesRefs<T extends Object>(
    Expression<T> Function($$PeriodEntriesTableAnnotationComposer a) f,
  ) {
    final $$PeriodEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.periodEntries,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PeriodEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.periodEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> insurancesRefs<T extends Object>(
    Expression<T> Function($$InsurancesTableAnnotationComposer a) f,
  ) {
    final $$InsurancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.insurances,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsurancesTableAnnotationComposer(
            $db: $db,
            $table: $db.insurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> remindersRefs<T extends Object>(
    Expression<T> Function($$RemindersTableAnnotationComposer a) f,
  ) {
    final $$RemindersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.profileId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableAnnotationComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProfilesTable,
          Profile,
          $$ProfilesTableFilterComposer,
          $$ProfilesTableOrderingComposer,
          $$ProfilesTableAnnotationComposer,
          $$ProfilesTableCreateCompanionBuilder,
          $$ProfilesTableUpdateCompanionBuilder,
          (Profile, $$ProfilesTableReferences),
          Profile,
          PrefetchHooks Function({
            bool healthConditionsRefs,
            bool doctorVisitsRefs,
            bool testReportsRefs,
            bool vitalReadingsRefs,
            bool periodEntriesRefs,
            bool insurancesRefs,
            bool remindersRefs,
          })
        > {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<String> sex = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProfilesCompanion(
                id: id,
                name: name,
                age: age,
                sex: sex,
                emoji: emoji,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int age,
                required String sex,
                required String emoji,
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProfilesCompanion.insert(
                id: id,
                name: name,
                age: age,
                sex: sex,
                emoji: emoji,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProfilesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                healthConditionsRefs = false,
                doctorVisitsRefs = false,
                testReportsRefs = false,
                vitalReadingsRefs = false,
                periodEntriesRefs = false,
                insurancesRefs = false,
                remindersRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (healthConditionsRefs) db.healthConditions,
                    if (doctorVisitsRefs) db.doctorVisits,
                    if (testReportsRefs) db.testReports,
                    if (vitalReadingsRefs) db.vitalReadings,
                    if (periodEntriesRefs) db.periodEntries,
                    if (insurancesRefs) db.insurances,
                    if (remindersRefs) db.reminders,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (healthConditionsRefs)
                        await $_getPrefetchedData<
                          Profile,
                          $ProfilesTable,
                          HealthCondition
                        >(
                          currentTable: table,
                          referencedTable: $$ProfilesTableReferences
                              ._healthConditionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).healthConditionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.profileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (doctorVisitsRefs)
                        await $_getPrefetchedData<
                          Profile,
                          $ProfilesTable,
                          DoctorVisit
                        >(
                          currentTable: table,
                          referencedTable: $$ProfilesTableReferences
                              ._doctorVisitsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).doctorVisitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.profileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (testReportsRefs)
                        await $_getPrefetchedData<
                          Profile,
                          $ProfilesTable,
                          TestReport
                        >(
                          currentTable: table,
                          referencedTable: $$ProfilesTableReferences
                              ._testReportsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).testReportsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.profileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (vitalReadingsRefs)
                        await $_getPrefetchedData<
                          Profile,
                          $ProfilesTable,
                          VitalReading
                        >(
                          currentTable: table,
                          referencedTable: $$ProfilesTableReferences
                              ._vitalReadingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).vitalReadingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.profileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (periodEntriesRefs)
                        await $_getPrefetchedData<
                          Profile,
                          $ProfilesTable,
                          PeriodEntry
                        >(
                          currentTable: table,
                          referencedTable: $$ProfilesTableReferences
                              ._periodEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).periodEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.profileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (insurancesRefs)
                        await $_getPrefetchedData<
                          Profile,
                          $ProfilesTable,
                          Insurance
                        >(
                          currentTable: table,
                          referencedTable: $$ProfilesTableReferences
                              ._insurancesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).insurancesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.profileId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (remindersRefs)
                        await $_getPrefetchedData<
                          Profile,
                          $ProfilesTable,
                          Reminder
                        >(
                          currentTable: table,
                          referencedTable: $$ProfilesTableReferences
                              ._remindersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).remindersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.profileId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProfilesTable,
      Profile,
      $$ProfilesTableFilterComposer,
      $$ProfilesTableOrderingComposer,
      $$ProfilesTableAnnotationComposer,
      $$ProfilesTableCreateCompanionBuilder,
      $$ProfilesTableUpdateCompanionBuilder,
      (Profile, $$ProfilesTableReferences),
      Profile,
      PrefetchHooks Function({
        bool healthConditionsRefs,
        bool doctorVisitsRefs,
        bool testReportsRefs,
        bool vitalReadingsRefs,
        bool periodEntriesRefs,
        bool insurancesRefs,
        bool remindersRefs,
      })
    >;
typedef $$HealthConditionsTableCreateCompanionBuilder =
    HealthConditionsCompanion Function({
      Value<int> id,
      required int profileId,
      required String name,
      Value<String?> type,
      Value<DateTime?> diagnosedAt,
      Value<String?> notes,
    });
typedef $$HealthConditionsTableUpdateCompanionBuilder =
    HealthConditionsCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> name,
      Value<String?> type,
      Value<DateTime?> diagnosedAt,
      Value<String?> notes,
    });

final class $$HealthConditionsTableReferences
    extends
        BaseReferences<_$AppDatabase, $HealthConditionsTable, HealthCondition> {
  $$HealthConditionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.profiles.createAlias(
        $_aliasNameGenerator(db.healthConditions.profileId, db.profiles.id),
      );

  $$ProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ProfilesTableTableManager(
      $_db,
      $_db.profiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HealthConditionsTableFilterComposer
    extends Composer<_$AppDatabase, $HealthConditionsTable> {
  $$HealthConditionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get diagnosedAt => $composableBuilder(
    column: $table.diagnosedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$ProfilesTableFilterComposer get profileId {
    final $$ProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableFilterComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HealthConditionsTableOrderingComposer
    extends Composer<_$AppDatabase, $HealthConditionsTable> {
  $$HealthConditionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get diagnosedAt => $composableBuilder(
    column: $table.diagnosedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProfilesTableOrderingComposer get profileId {
    final $$ProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HealthConditionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HealthConditionsTable> {
  $$HealthConditionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get diagnosedAt => $composableBuilder(
    column: $table.diagnosedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$ProfilesTableAnnotationComposer get profileId {
    final $$ProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HealthConditionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HealthConditionsTable,
          HealthCondition,
          $$HealthConditionsTableFilterComposer,
          $$HealthConditionsTableOrderingComposer,
          $$HealthConditionsTableAnnotationComposer,
          $$HealthConditionsTableCreateCompanionBuilder,
          $$HealthConditionsTableUpdateCompanionBuilder,
          (HealthCondition, $$HealthConditionsTableReferences),
          HealthCondition,
          PrefetchHooks Function({bool profileId})
        > {
  $$HealthConditionsTableTableManager(
    _$AppDatabase db,
    $HealthConditionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HealthConditionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HealthConditionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HealthConditionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<DateTime?> diagnosedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => HealthConditionsCompanion(
                id: id,
                profileId: profileId,
                name: name,
                type: type,
                diagnosedAt: diagnosedAt,
                notes: notes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String name,
                Value<String?> type = const Value.absent(),
                Value<DateTime?> diagnosedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
              }) => HealthConditionsCompanion.insert(
                id: id,
                profileId: profileId,
                name: name,
                type: type,
                diagnosedAt: diagnosedAt,
                notes: notes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HealthConditionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (profileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.profileId,
                                referencedTable:
                                    $$HealthConditionsTableReferences
                                        ._profileIdTable(db),
                                referencedColumn:
                                    $$HealthConditionsTableReferences
                                        ._profileIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HealthConditionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HealthConditionsTable,
      HealthCondition,
      $$HealthConditionsTableFilterComposer,
      $$HealthConditionsTableOrderingComposer,
      $$HealthConditionsTableAnnotationComposer,
      $$HealthConditionsTableCreateCompanionBuilder,
      $$HealthConditionsTableUpdateCompanionBuilder,
      (HealthCondition, $$HealthConditionsTableReferences),
      HealthCondition,
      PrefetchHooks Function({bool profileId})
    >;
typedef $$DoctorVisitsTableCreateCompanionBuilder =
    DoctorVisitsCompanion Function({
      Value<int> id,
      required int profileId,
      required String doctorName,
      Value<String?> doctorContact,
      Value<String?> hospital,
      Value<DateTime> visitDate,
      Value<String?> notes,
      Value<DateTime?> followUpDate,
    });
typedef $$DoctorVisitsTableUpdateCompanionBuilder =
    DoctorVisitsCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> doctorName,
      Value<String?> doctorContact,
      Value<String?> hospital,
      Value<DateTime> visitDate,
      Value<String?> notes,
      Value<DateTime?> followUpDate,
    });

final class $$DoctorVisitsTableReferences
    extends BaseReferences<_$AppDatabase, $DoctorVisitsTable, DoctorVisit> {
  $$DoctorVisitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.profiles.createAlias(
        $_aliasNameGenerator(db.doctorVisits.profileId, db.profiles.id),
      );

  $$ProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ProfilesTableTableManager(
      $_db,
      $_db.profiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PrescriptionsTable, List<Prescription>>
  _prescriptionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.prescriptions,
    aliasName: $_aliasNameGenerator(
      db.doctorVisits.id,
      db.prescriptions.visitId,
    ),
  );

  $$PrescriptionsTableProcessedTableManager get prescriptionsRefs {
    final manager = $$PrescriptionsTableTableManager(
      $_db,
      $_db.prescriptions,
    ).filter((f) => f.visitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_prescriptionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$TestReportsTable, List<TestReport>>
  _testReportsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.testReports,
    aliasName: $_aliasNameGenerator(db.doctorVisits.id, db.testReports.visitId),
  );

  $$TestReportsTableProcessedTableManager get testReportsRefs {
    final manager = $$TestReportsTableTableManager(
      $_db,
      $_db.testReports,
    ).filter((f) => f.visitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_testReportsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DoctorVisitsTableFilterComposer
    extends Composer<_$AppDatabase, $DoctorVisitsTable> {
  $$DoctorVisitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doctorContact => $composableBuilder(
    column: $table.doctorContact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hospital => $composableBuilder(
    column: $table.hospital,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get visitDate => $composableBuilder(
    column: $table.visitDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get followUpDate => $composableBuilder(
    column: $table.followUpDate,
    builder: (column) => ColumnFilters(column),
  );

  $$ProfilesTableFilterComposer get profileId {
    final $$ProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableFilterComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> prescriptionsRefs(
    Expression<bool> Function($$PrescriptionsTableFilterComposer f) f,
  ) {
    final $$PrescriptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.prescriptions,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrescriptionsTableFilterComposer(
            $db: $db,
            $table: $db.prescriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> testReportsRefs(
    Expression<bool> Function($$TestReportsTableFilterComposer f) f,
  ) {
    final $$TestReportsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testReports,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestReportsTableFilterComposer(
            $db: $db,
            $table: $db.testReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DoctorVisitsTableOrderingComposer
    extends Composer<_$AppDatabase, $DoctorVisitsTable> {
  $$DoctorVisitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doctorContact => $composableBuilder(
    column: $table.doctorContact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hospital => $composableBuilder(
    column: $table.hospital,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get visitDate => $composableBuilder(
    column: $table.visitDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get followUpDate => $composableBuilder(
    column: $table.followUpDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProfilesTableOrderingComposer get profileId {
    final $$ProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoctorVisitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoctorVisitsTable> {
  $$DoctorVisitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get doctorContact => $composableBuilder(
    column: $table.doctorContact,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hospital =>
      $composableBuilder(column: $table.hospital, builder: (column) => column);

  GeneratedColumn<DateTime> get visitDate =>
      $composableBuilder(column: $table.visitDate, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get followUpDate => $composableBuilder(
    column: $table.followUpDate,
    builder: (column) => column,
  );

  $$ProfilesTableAnnotationComposer get profileId {
    final $$ProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> prescriptionsRefs<T extends Object>(
    Expression<T> Function($$PrescriptionsTableAnnotationComposer a) f,
  ) {
    final $$PrescriptionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.prescriptions,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PrescriptionsTableAnnotationComposer(
            $db: $db,
            $table: $db.prescriptions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> testReportsRefs<T extends Object>(
    Expression<T> Function($$TestReportsTableAnnotationComposer a) f,
  ) {
    final $$TestReportsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.testReports,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TestReportsTableAnnotationComposer(
            $db: $db,
            $table: $db.testReports,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DoctorVisitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DoctorVisitsTable,
          DoctorVisit,
          $$DoctorVisitsTableFilterComposer,
          $$DoctorVisitsTableOrderingComposer,
          $$DoctorVisitsTableAnnotationComposer,
          $$DoctorVisitsTableCreateCompanionBuilder,
          $$DoctorVisitsTableUpdateCompanionBuilder,
          (DoctorVisit, $$DoctorVisitsTableReferences),
          DoctorVisit,
          PrefetchHooks Function({
            bool profileId,
            bool prescriptionsRefs,
            bool testReportsRefs,
          })
        > {
  $$DoctorVisitsTableTableManager(_$AppDatabase db, $DoctorVisitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoctorVisitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoctorVisitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoctorVisitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> doctorName = const Value.absent(),
                Value<String?> doctorContact = const Value.absent(),
                Value<String?> hospital = const Value.absent(),
                Value<DateTime> visitDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime?> followUpDate = const Value.absent(),
              }) => DoctorVisitsCompanion(
                id: id,
                profileId: profileId,
                doctorName: doctorName,
                doctorContact: doctorContact,
                hospital: hospital,
                visitDate: visitDate,
                notes: notes,
                followUpDate: followUpDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String doctorName,
                Value<String?> doctorContact = const Value.absent(),
                Value<String?> hospital = const Value.absent(),
                Value<DateTime> visitDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime?> followUpDate = const Value.absent(),
              }) => DoctorVisitsCompanion.insert(
                id: id,
                profileId: profileId,
                doctorName: doctorName,
                doctorContact: doctorContact,
                hospital: hospital,
                visitDate: visitDate,
                notes: notes,
                followUpDate: followUpDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DoctorVisitsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                profileId = false,
                prescriptionsRefs = false,
                testReportsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (prescriptionsRefs) db.prescriptions,
                    if (testReportsRefs) db.testReports,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (profileId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.profileId,
                                    referencedTable:
                                        $$DoctorVisitsTableReferences
                                            ._profileIdTable(db),
                                    referencedColumn:
                                        $$DoctorVisitsTableReferences
                                            ._profileIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (prescriptionsRefs)
                        await $_getPrefetchedData<
                          DoctorVisit,
                          $DoctorVisitsTable,
                          Prescription
                        >(
                          currentTable: table,
                          referencedTable: $$DoctorVisitsTableReferences
                              ._prescriptionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DoctorVisitsTableReferences(
                                db,
                                table,
                                p0,
                              ).prescriptionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.visitId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (testReportsRefs)
                        await $_getPrefetchedData<
                          DoctorVisit,
                          $DoctorVisitsTable,
                          TestReport
                        >(
                          currentTable: table,
                          referencedTable: $$DoctorVisitsTableReferences
                              ._testReportsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DoctorVisitsTableReferences(
                                db,
                                table,
                                p0,
                              ).testReportsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.visitId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DoctorVisitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DoctorVisitsTable,
      DoctorVisit,
      $$DoctorVisitsTableFilterComposer,
      $$DoctorVisitsTableOrderingComposer,
      $$DoctorVisitsTableAnnotationComposer,
      $$DoctorVisitsTableCreateCompanionBuilder,
      $$DoctorVisitsTableUpdateCompanionBuilder,
      (DoctorVisit, $$DoctorVisitsTableReferences),
      DoctorVisit,
      PrefetchHooks Function({
        bool profileId,
        bool prescriptionsRefs,
        bool testReportsRefs,
      })
    >;
typedef $$PrescriptionsTableCreateCompanionBuilder =
    PrescriptionsCompanion Function({
      Value<int> id,
      required int visitId,
      Value<int?> medicineId,
      required String medicineName,
      required String dosage,
      required String frequency,
      Value<int?> durationDays,
      Value<String?> notes,
      Value<DateTime> startDate,
      Value<bool> isActive,
    });
typedef $$PrescriptionsTableUpdateCompanionBuilder =
    PrescriptionsCompanion Function({
      Value<int> id,
      Value<int> visitId,
      Value<int?> medicineId,
      Value<String> medicineName,
      Value<String> dosage,
      Value<String> frequency,
      Value<int?> durationDays,
      Value<String?> notes,
      Value<DateTime> startDate,
      Value<bool> isActive,
    });

final class $$PrescriptionsTableReferences
    extends BaseReferences<_$AppDatabase, $PrescriptionsTable, Prescription> {
  $$PrescriptionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DoctorVisitsTable _visitIdTable(_$AppDatabase db) =>
      db.doctorVisits.createAlias(
        $_aliasNameGenerator(db.prescriptions.visitId, db.doctorVisits.id),
      );

  $$DoctorVisitsTableProcessedTableManager get visitId {
    final $_column = $_itemColumn<int>('visit_id')!;

    final manager = $$DoctorVisitsTableTableManager(
      $_db,
      $_db.doctorVisits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_visitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PrescriptionsTableFilterComposer
    extends Composer<_$AppDatabase, $PrescriptionsTable> {
  $$PrescriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get medicineId => $composableBuilder(
    column: $table.medicineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicineName => $composableBuilder(
    column: $table.medicineName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationDays => $composableBuilder(
    column: $table.durationDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$DoctorVisitsTableFilterComposer get visitId {
    final $$DoctorVisitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.doctorVisits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorVisitsTableFilterComposer(
            $db: $db,
            $table: $db.doctorVisits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrescriptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PrescriptionsTable> {
  $$PrescriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get medicineId => $composableBuilder(
    column: $table.medicineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicineName => $composableBuilder(
    column: $table.medicineName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationDays => $composableBuilder(
    column: $table.durationDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$DoctorVisitsTableOrderingComposer get visitId {
    final $$DoctorVisitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.doctorVisits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorVisitsTableOrderingComposer(
            $db: $db,
            $table: $db.doctorVisits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrescriptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PrescriptionsTable> {
  $$PrescriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get medicineId => $composableBuilder(
    column: $table.medicineId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get medicineName => $composableBuilder(
    column: $table.medicineName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumn<String> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<int> get durationDays => $composableBuilder(
    column: $table.durationDays,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$DoctorVisitsTableAnnotationComposer get visitId {
    final $$DoctorVisitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.doctorVisits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorVisitsTableAnnotationComposer(
            $db: $db,
            $table: $db.doctorVisits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PrescriptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PrescriptionsTable,
          Prescription,
          $$PrescriptionsTableFilterComposer,
          $$PrescriptionsTableOrderingComposer,
          $$PrescriptionsTableAnnotationComposer,
          $$PrescriptionsTableCreateCompanionBuilder,
          $$PrescriptionsTableUpdateCompanionBuilder,
          (Prescription, $$PrescriptionsTableReferences),
          Prescription,
          PrefetchHooks Function({bool visitId})
        > {
  $$PrescriptionsTableTableManager(_$AppDatabase db, $PrescriptionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PrescriptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PrescriptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PrescriptionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> visitId = const Value.absent(),
                Value<int?> medicineId = const Value.absent(),
                Value<String> medicineName = const Value.absent(),
                Value<String> dosage = const Value.absent(),
                Value<String> frequency = const Value.absent(),
                Value<int?> durationDays = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => PrescriptionsCompanion(
                id: id,
                visitId: visitId,
                medicineId: medicineId,
                medicineName: medicineName,
                dosage: dosage,
                frequency: frequency,
                durationDays: durationDays,
                notes: notes,
                startDate: startDate,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int visitId,
                Value<int?> medicineId = const Value.absent(),
                required String medicineName,
                required String dosage,
                required String frequency,
                Value<int?> durationDays = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
              }) => PrescriptionsCompanion.insert(
                id: id,
                visitId: visitId,
                medicineId: medicineId,
                medicineName: medicineName,
                dosage: dosage,
                frequency: frequency,
                durationDays: durationDays,
                notes: notes,
                startDate: startDate,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PrescriptionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({visitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (visitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.visitId,
                                referencedTable: $$PrescriptionsTableReferences
                                    ._visitIdTable(db),
                                referencedColumn: $$PrescriptionsTableReferences
                                    ._visitIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PrescriptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PrescriptionsTable,
      Prescription,
      $$PrescriptionsTableFilterComposer,
      $$PrescriptionsTableOrderingComposer,
      $$PrescriptionsTableAnnotationComposer,
      $$PrescriptionsTableCreateCompanionBuilder,
      $$PrescriptionsTableUpdateCompanionBuilder,
      (Prescription, $$PrescriptionsTableReferences),
      Prescription,
      PrefetchHooks Function({bool visitId})
    >;
typedef $$TestReportsTableCreateCompanionBuilder =
    TestReportsCompanion Function({
      Value<int> id,
      required int profileId,
      Value<int?> visitId,
      required String testName,
      Value<DateTime> date,
      Value<String?> result,
      Value<String?> notes,
      Value<String?> filePath,
      Value<String?> extractedText,
    });
typedef $$TestReportsTableUpdateCompanionBuilder =
    TestReportsCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<int?> visitId,
      Value<String> testName,
      Value<DateTime> date,
      Value<String?> result,
      Value<String?> notes,
      Value<String?> filePath,
      Value<String?> extractedText,
    });

final class $$TestReportsTableReferences
    extends BaseReferences<_$AppDatabase, $TestReportsTable, TestReport> {
  $$TestReportsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.profiles.createAlias(
        $_aliasNameGenerator(db.testReports.profileId, db.profiles.id),
      );

  $$ProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ProfilesTableTableManager(
      $_db,
      $_db.profiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DoctorVisitsTable _visitIdTable(_$AppDatabase db) =>
      db.doctorVisits.createAlias(
        $_aliasNameGenerator(db.testReports.visitId, db.doctorVisits.id),
      );

  $$DoctorVisitsTableProcessedTableManager? get visitId {
    final $_column = $_itemColumn<int>('visit_id');
    if ($_column == null) return null;
    final manager = $$DoctorVisitsTableTableManager(
      $_db,
      $_db.doctorVisits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_visitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TestReportsTableFilterComposer
    extends Composer<_$AppDatabase, $TestReportsTable> {
  $$TestReportsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testName => $composableBuilder(
    column: $table.testName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extractedText => $composableBuilder(
    column: $table.extractedText,
    builder: (column) => ColumnFilters(column),
  );

  $$ProfilesTableFilterComposer get profileId {
    final $$ProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableFilterComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DoctorVisitsTableFilterComposer get visitId {
    final $$DoctorVisitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.doctorVisits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorVisitsTableFilterComposer(
            $db: $db,
            $table: $db.doctorVisits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestReportsTableOrderingComposer
    extends Composer<_$AppDatabase, $TestReportsTable> {
  $$TestReportsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testName => $composableBuilder(
    column: $table.testName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extractedText => $composableBuilder(
    column: $table.extractedText,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProfilesTableOrderingComposer get profileId {
    final $$ProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DoctorVisitsTableOrderingComposer get visitId {
    final $$DoctorVisitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.doctorVisits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorVisitsTableOrderingComposer(
            $db: $db,
            $table: $db.doctorVisits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestReportsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestReportsTable> {
  $$TestReportsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get testName =>
      $composableBuilder(column: $table.testName, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get extractedText => $composableBuilder(
    column: $table.extractedText,
    builder: (column) => column,
  );

  $$ProfilesTableAnnotationComposer get profileId {
    final $$ProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DoctorVisitsTableAnnotationComposer get visitId {
    final $$DoctorVisitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.doctorVisits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorVisitsTableAnnotationComposer(
            $db: $db,
            $table: $db.doctorVisits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TestReportsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TestReportsTable,
          TestReport,
          $$TestReportsTableFilterComposer,
          $$TestReportsTableOrderingComposer,
          $$TestReportsTableAnnotationComposer,
          $$TestReportsTableCreateCompanionBuilder,
          $$TestReportsTableUpdateCompanionBuilder,
          (TestReport, $$TestReportsTableReferences),
          TestReport,
          PrefetchHooks Function({bool profileId, bool visitId})
        > {
  $$TestReportsTableTableManager(_$AppDatabase db, $TestReportsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TestReportsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TestReportsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TestReportsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<int?> visitId = const Value.absent(),
                Value<String> testName = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> result = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> extractedText = const Value.absent(),
              }) => TestReportsCompanion(
                id: id,
                profileId: profileId,
                visitId: visitId,
                testName: testName,
                date: date,
                result: result,
                notes: notes,
                filePath: filePath,
                extractedText: extractedText,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                Value<int?> visitId = const Value.absent(),
                required String testName,
                Value<DateTime> date = const Value.absent(),
                Value<String?> result = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String?> extractedText = const Value.absent(),
              }) => TestReportsCompanion.insert(
                id: id,
                profileId: profileId,
                visitId: visitId,
                testName: testName,
                date: date,
                result: result,
                notes: notes,
                filePath: filePath,
                extractedText: extractedText,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TestReportsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileId = false, visitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (profileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.profileId,
                                referencedTable: $$TestReportsTableReferences
                                    ._profileIdTable(db),
                                referencedColumn: $$TestReportsTableReferences
                                    ._profileIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (visitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.visitId,
                                referencedTable: $$TestReportsTableReferences
                                    ._visitIdTable(db),
                                referencedColumn: $$TestReportsTableReferences
                                    ._visitIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TestReportsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TestReportsTable,
      TestReport,
      $$TestReportsTableFilterComposer,
      $$TestReportsTableOrderingComposer,
      $$TestReportsTableAnnotationComposer,
      $$TestReportsTableCreateCompanionBuilder,
      $$TestReportsTableUpdateCompanionBuilder,
      (TestReport, $$TestReportsTableReferences),
      TestReport,
      PrefetchHooks Function({bool profileId, bool visitId})
    >;
typedef $$VitalReadingsTableCreateCompanionBuilder =
    VitalReadingsCompanion Function({
      Value<int> id,
      required int profileId,
      required String type,
      Value<String?> unit,
      required double value1,
      Value<double?> value2,
      Value<DateTime> recordedAt,
      Value<String?> notes,
      Value<String?> context,
    });
typedef $$VitalReadingsTableUpdateCompanionBuilder =
    VitalReadingsCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> type,
      Value<String?> unit,
      Value<double> value1,
      Value<double?> value2,
      Value<DateTime> recordedAt,
      Value<String?> notes,
      Value<String?> context,
    });

final class $$VitalReadingsTableReferences
    extends BaseReferences<_$AppDatabase, $VitalReadingsTable, VitalReading> {
  $$VitalReadingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.profiles.createAlias(
        $_aliasNameGenerator(db.vitalReadings.profileId, db.profiles.id),
      );

  $$ProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ProfilesTableTableManager(
      $_db,
      $_db.profiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VitalReadingsTableFilterComposer
    extends Composer<_$AppDatabase, $VitalReadingsTable> {
  $$VitalReadingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value1 => $composableBuilder(
    column: $table.value1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value2 => $composableBuilder(
    column: $table.value2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get context => $composableBuilder(
    column: $table.context,
    builder: (column) => ColumnFilters(column),
  );

  $$ProfilesTableFilterComposer get profileId {
    final $$ProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableFilterComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VitalReadingsTableOrderingComposer
    extends Composer<_$AppDatabase, $VitalReadingsTable> {
  $$VitalReadingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value1 => $composableBuilder(
    column: $table.value1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value2 => $composableBuilder(
    column: $table.value2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get context => $composableBuilder(
    column: $table.context,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProfilesTableOrderingComposer get profileId {
    final $$ProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VitalReadingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VitalReadingsTable> {
  $$VitalReadingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get value1 =>
      $composableBuilder(column: $table.value1, builder: (column) => column);

  GeneratedColumn<double> get value2 =>
      $composableBuilder(column: $table.value2, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get context =>
      $composableBuilder(column: $table.context, builder: (column) => column);

  $$ProfilesTableAnnotationComposer get profileId {
    final $$ProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VitalReadingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VitalReadingsTable,
          VitalReading,
          $$VitalReadingsTableFilterComposer,
          $$VitalReadingsTableOrderingComposer,
          $$VitalReadingsTableAnnotationComposer,
          $$VitalReadingsTableCreateCompanionBuilder,
          $$VitalReadingsTableUpdateCompanionBuilder,
          (VitalReading, $$VitalReadingsTableReferences),
          VitalReading,
          PrefetchHooks Function({bool profileId})
        > {
  $$VitalReadingsTableTableManager(_$AppDatabase db, $VitalReadingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VitalReadingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VitalReadingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VitalReadingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String?> unit = const Value.absent(),
                Value<double> value1 = const Value.absent(),
                Value<double?> value2 = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> context = const Value.absent(),
              }) => VitalReadingsCompanion(
                id: id,
                profileId: profileId,
                type: type,
                unit: unit,
                value1: value1,
                value2: value2,
                recordedAt: recordedAt,
                notes: notes,
                context: context,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String type,
                Value<String?> unit = const Value.absent(),
                required double value1,
                Value<double?> value2 = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> context = const Value.absent(),
              }) => VitalReadingsCompanion.insert(
                id: id,
                profileId: profileId,
                type: type,
                unit: unit,
                value1: value1,
                value2: value2,
                recordedAt: recordedAt,
                notes: notes,
                context: context,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VitalReadingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (profileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.profileId,
                                referencedTable: $$VitalReadingsTableReferences
                                    ._profileIdTable(db),
                                referencedColumn: $$VitalReadingsTableReferences
                                    ._profileIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VitalReadingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VitalReadingsTable,
      VitalReading,
      $$VitalReadingsTableFilterComposer,
      $$VitalReadingsTableOrderingComposer,
      $$VitalReadingsTableAnnotationComposer,
      $$VitalReadingsTableCreateCompanionBuilder,
      $$VitalReadingsTableUpdateCompanionBuilder,
      (VitalReading, $$VitalReadingsTableReferences),
      VitalReading,
      PrefetchHooks Function({bool profileId})
    >;
typedef $$PeriodEntriesTableCreateCompanionBuilder =
    PeriodEntriesCompanion Function({
      Value<int> id,
      required int profileId,
      required DateTime startDate,
      Value<DateTime?> endDate,
      Value<String?> flowIntensity,
      Value<String?> symptoms,
      Value<String?> notes,
      Value<String?> mood,
      Value<bool> isPainful,
      Value<bool> isPrediction,
    });
typedef $$PeriodEntriesTableUpdateCompanionBuilder =
    PeriodEntriesCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<DateTime> startDate,
      Value<DateTime?> endDate,
      Value<String?> flowIntensity,
      Value<String?> symptoms,
      Value<String?> notes,
      Value<String?> mood,
      Value<bool> isPainful,
      Value<bool> isPrediction,
    });

final class $$PeriodEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $PeriodEntriesTable, PeriodEntry> {
  $$PeriodEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.profiles.createAlias(
        $_aliasNameGenerator(db.periodEntries.profileId, db.profiles.id),
      );

  $$ProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ProfilesTableTableManager(
      $_db,
      $_db.profiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PeriodEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $PeriodEntriesTable> {
  $$PeriodEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get flowIntensity => $composableBuilder(
    column: $table.flowIntensity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symptoms => $composableBuilder(
    column: $table.symptoms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPainful => $composableBuilder(
    column: $table.isPainful,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPrediction => $composableBuilder(
    column: $table.isPrediction,
    builder: (column) => ColumnFilters(column),
  );

  $$ProfilesTableFilterComposer get profileId {
    final $$ProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableFilterComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PeriodEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $PeriodEntriesTable> {
  $$PeriodEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get flowIntensity => $composableBuilder(
    column: $table.flowIntensity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symptoms => $composableBuilder(
    column: $table.symptoms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPainful => $composableBuilder(
    column: $table.isPainful,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPrediction => $composableBuilder(
    column: $table.isPrediction,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProfilesTableOrderingComposer get profileId {
    final $$ProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PeriodEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PeriodEntriesTable> {
  $$PeriodEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get flowIntensity => $composableBuilder(
    column: $table.flowIntensity,
    builder: (column) => column,
  );

  GeneratedColumn<String> get symptoms =>
      $composableBuilder(column: $table.symptoms, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<bool> get isPainful =>
      $composableBuilder(column: $table.isPainful, builder: (column) => column);

  GeneratedColumn<bool> get isPrediction => $composableBuilder(
    column: $table.isPrediction,
    builder: (column) => column,
  );

  $$ProfilesTableAnnotationComposer get profileId {
    final $$ProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PeriodEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PeriodEntriesTable,
          PeriodEntry,
          $$PeriodEntriesTableFilterComposer,
          $$PeriodEntriesTableOrderingComposer,
          $$PeriodEntriesTableAnnotationComposer,
          $$PeriodEntriesTableCreateCompanionBuilder,
          $$PeriodEntriesTableUpdateCompanionBuilder,
          (PeriodEntry, $$PeriodEntriesTableReferences),
          PeriodEntry,
          PrefetchHooks Function({bool profileId})
        > {
  $$PeriodEntriesTableTableManager(_$AppDatabase db, $PeriodEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PeriodEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PeriodEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PeriodEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<String?> flowIntensity = const Value.absent(),
                Value<String?> symptoms = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> mood = const Value.absent(),
                Value<bool> isPainful = const Value.absent(),
                Value<bool> isPrediction = const Value.absent(),
              }) => PeriodEntriesCompanion(
                id: id,
                profileId: profileId,
                startDate: startDate,
                endDate: endDate,
                flowIntensity: flowIntensity,
                symptoms: symptoms,
                notes: notes,
                mood: mood,
                isPainful: isPainful,
                isPrediction: isPrediction,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required DateTime startDate,
                Value<DateTime?> endDate = const Value.absent(),
                Value<String?> flowIntensity = const Value.absent(),
                Value<String?> symptoms = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> mood = const Value.absent(),
                Value<bool> isPainful = const Value.absent(),
                Value<bool> isPrediction = const Value.absent(),
              }) => PeriodEntriesCompanion.insert(
                id: id,
                profileId: profileId,
                startDate: startDate,
                endDate: endDate,
                flowIntensity: flowIntensity,
                symptoms: symptoms,
                notes: notes,
                mood: mood,
                isPainful: isPainful,
                isPrediction: isPrediction,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PeriodEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (profileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.profileId,
                                referencedTable: $$PeriodEntriesTableReferences
                                    ._profileIdTable(db),
                                referencedColumn: $$PeriodEntriesTableReferences
                                    ._profileIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PeriodEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PeriodEntriesTable,
      PeriodEntry,
      $$PeriodEntriesTableFilterComposer,
      $$PeriodEntriesTableOrderingComposer,
      $$PeriodEntriesTableAnnotationComposer,
      $$PeriodEntriesTableCreateCompanionBuilder,
      $$PeriodEntriesTableUpdateCompanionBuilder,
      (PeriodEntry, $$PeriodEntriesTableReferences),
      PeriodEntry,
      PrefetchHooks Function({bool profileId})
    >;
typedef $$InsurancesTableCreateCompanionBuilder =
    InsurancesCompanion Function({
      Value<int> id,
      required int profileId,
      required String providerName,
      required String policyNumber,
      Value<double?> premiumAmount,
      Value<DateTime?> premiumDueDate,
      Value<DateTime?> validUntil,
      Value<String?> coverageDetails,
      Value<String?> contactNumber,
      Value<String?> notes,
      Value<String?> policyDocumentPath,
    });
typedef $$InsurancesTableUpdateCompanionBuilder =
    InsurancesCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> providerName,
      Value<String> policyNumber,
      Value<double?> premiumAmount,
      Value<DateTime?> premiumDueDate,
      Value<DateTime?> validUntil,
      Value<String?> coverageDetails,
      Value<String?> contactNumber,
      Value<String?> notes,
      Value<String?> policyDocumentPath,
    });

final class $$InsurancesTableReferences
    extends BaseReferences<_$AppDatabase, $InsurancesTable, Insurance> {
  $$InsurancesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.profiles.createAlias(
        $_aliasNameGenerator(db.insurances.profileId, db.profiles.id),
      );

  $$ProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ProfilesTableTableManager(
      $_db,
      $_db.profiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InsurancesTableFilterComposer
    extends Composer<_$AppDatabase, $InsurancesTable> {
  $$InsurancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get policyNumber => $composableBuilder(
    column: $table.policyNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get premiumAmount => $composableBuilder(
    column: $table.premiumAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get premiumDueDate => $composableBuilder(
    column: $table.premiumDueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get validUntil => $composableBuilder(
    column: $table.validUntil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverageDetails => $composableBuilder(
    column: $table.coverageDetails,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get policyDocumentPath => $composableBuilder(
    column: $table.policyDocumentPath,
    builder: (column) => ColumnFilters(column),
  );

  $$ProfilesTableFilterComposer get profileId {
    final $$ProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableFilterComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InsurancesTableOrderingComposer
    extends Composer<_$AppDatabase, $InsurancesTable> {
  $$InsurancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get policyNumber => $composableBuilder(
    column: $table.policyNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get premiumAmount => $composableBuilder(
    column: $table.premiumAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get premiumDueDate => $composableBuilder(
    column: $table.premiumDueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get validUntil => $composableBuilder(
    column: $table.validUntil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverageDetails => $composableBuilder(
    column: $table.coverageDetails,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get policyDocumentPath => $composableBuilder(
    column: $table.policyDocumentPath,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProfilesTableOrderingComposer get profileId {
    final $$ProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InsurancesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InsurancesTable> {
  $$InsurancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get providerName => $composableBuilder(
    column: $table.providerName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get policyNumber => $composableBuilder(
    column: $table.policyNumber,
    builder: (column) => column,
  );

  GeneratedColumn<double> get premiumAmount => $composableBuilder(
    column: $table.premiumAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get premiumDueDate => $composableBuilder(
    column: $table.premiumDueDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get validUntil => $composableBuilder(
    column: $table.validUntil,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverageDetails => $composableBuilder(
    column: $table.coverageDetails,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contactNumber => $composableBuilder(
    column: $table.contactNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get policyDocumentPath => $composableBuilder(
    column: $table.policyDocumentPath,
    builder: (column) => column,
  );

  $$ProfilesTableAnnotationComposer get profileId {
    final $$ProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InsurancesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InsurancesTable,
          Insurance,
          $$InsurancesTableFilterComposer,
          $$InsurancesTableOrderingComposer,
          $$InsurancesTableAnnotationComposer,
          $$InsurancesTableCreateCompanionBuilder,
          $$InsurancesTableUpdateCompanionBuilder,
          (Insurance, $$InsurancesTableReferences),
          Insurance,
          PrefetchHooks Function({bool profileId})
        > {
  $$InsurancesTableTableManager(_$AppDatabase db, $InsurancesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InsurancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InsurancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InsurancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> providerName = const Value.absent(),
                Value<String> policyNumber = const Value.absent(),
                Value<double?> premiumAmount = const Value.absent(),
                Value<DateTime?> premiumDueDate = const Value.absent(),
                Value<DateTime?> validUntil = const Value.absent(),
                Value<String?> coverageDetails = const Value.absent(),
                Value<String?> contactNumber = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> policyDocumentPath = const Value.absent(),
              }) => InsurancesCompanion(
                id: id,
                profileId: profileId,
                providerName: providerName,
                policyNumber: policyNumber,
                premiumAmount: premiumAmount,
                premiumDueDate: premiumDueDate,
                validUntil: validUntil,
                coverageDetails: coverageDetails,
                contactNumber: contactNumber,
                notes: notes,
                policyDocumentPath: policyDocumentPath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String providerName,
                required String policyNumber,
                Value<double?> premiumAmount = const Value.absent(),
                Value<DateTime?> premiumDueDate = const Value.absent(),
                Value<DateTime?> validUntil = const Value.absent(),
                Value<String?> coverageDetails = const Value.absent(),
                Value<String?> contactNumber = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> policyDocumentPath = const Value.absent(),
              }) => InsurancesCompanion.insert(
                id: id,
                profileId: profileId,
                providerName: providerName,
                policyNumber: policyNumber,
                premiumAmount: premiumAmount,
                premiumDueDate: premiumDueDate,
                validUntil: validUntil,
                coverageDetails: coverageDetails,
                contactNumber: contactNumber,
                notes: notes,
                policyDocumentPath: policyDocumentPath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InsurancesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (profileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.profileId,
                                referencedTable: $$InsurancesTableReferences
                                    ._profileIdTable(db),
                                referencedColumn: $$InsurancesTableReferences
                                    ._profileIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InsurancesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InsurancesTable,
      Insurance,
      $$InsurancesTableFilterComposer,
      $$InsurancesTableOrderingComposer,
      $$InsurancesTableAnnotationComposer,
      $$InsurancesTableCreateCompanionBuilder,
      $$InsurancesTableUpdateCompanionBuilder,
      (Insurance, $$InsurancesTableReferences),
      Insurance,
      PrefetchHooks Function({bool profileId})
    >;
typedef $$RemindersTableCreateCompanionBuilder =
    RemindersCompanion Function({
      Value<int> id,
      required int profileId,
      required String type,
      required String title,
      Value<String?> description,
      required DateTime scheduledAt,
      Value<String?> repeatPattern,
      Value<bool> isActive,
      Value<int?> entityId,
    });
typedef $$RemindersTableUpdateCompanionBuilder =
    RemindersCompanion Function({
      Value<int> id,
      Value<int> profileId,
      Value<String> type,
      Value<String> title,
      Value<String?> description,
      Value<DateTime> scheduledAt,
      Value<String?> repeatPattern,
      Value<bool> isActive,
      Value<int?> entityId,
    });

final class $$RemindersTableReferences
    extends BaseReferences<_$AppDatabase, $RemindersTable, Reminder> {
  $$RemindersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ProfilesTable _profileIdTable(_$AppDatabase db) =>
      db.profiles.createAlias(
        $_aliasNameGenerator(db.reminders.profileId, db.profiles.id),
      );

  $$ProfilesTableProcessedTableManager get profileId {
    final $_column = $_itemColumn<int>('profile_id')!;

    final manager = $$ProfilesTableTableManager(
      $_db,
      $_db.profiles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_profileIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get repeatPattern => $composableBuilder(
    column: $table.repeatPattern,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  $$ProfilesTableFilterComposer get profileId {
    final $$ProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableFilterComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get repeatPattern => $composableBuilder(
    column: $table.repeatPattern,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  $$ProfilesTableOrderingComposer get profileId {
    final $$ProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get repeatPattern => $composableBuilder(
    column: $table.repeatPattern,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  $$ProfilesTableAnnotationComposer get profileId {
    final $$ProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.profileId,
      referencedTable: $db.profiles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.profiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          Reminder,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (Reminder, $$RemindersTableReferences),
          Reminder,
          PrefetchHooks Function({bool profileId})
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> profileId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<String?> repeatPattern = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int?> entityId = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                profileId: profileId,
                type: type,
                title: title,
                description: description,
                scheduledAt: scheduledAt,
                repeatPattern: repeatPattern,
                isActive: isActive,
                entityId: entityId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int profileId,
                required String type,
                required String title,
                Value<String?> description = const Value.absent(),
                required DateTime scheduledAt,
                Value<String?> repeatPattern = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int?> entityId = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                profileId: profileId,
                type: type,
                title: title,
                description: description,
                scheduledAt: scheduledAt,
                repeatPattern: repeatPattern,
                isActive: isActive,
                entityId: entityId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RemindersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({profileId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (profileId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.profileId,
                                referencedTable: $$RemindersTableReferences
                                    ._profileIdTable(db),
                                referencedColumn: $$RemindersTableReferences
                                    ._profileIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      Reminder,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (Reminder, $$RemindersTableReferences),
      Reminder,
      PrefetchHooks Function({bool profileId})
    >;
typedef $$HealthTipsTableCreateCompanionBuilder =
    HealthTipsCompanion Function({
      Value<int> id,
      required String category,
      required String title,
      required String content,
      required String source,
    });
typedef $$HealthTipsTableUpdateCompanionBuilder =
    HealthTipsCompanion Function({
      Value<int> id,
      Value<String> category,
      Value<String> title,
      Value<String> content,
      Value<String> source,
    });

class $$HealthTipsTableFilterComposer
    extends Composer<_$AppDatabase, $HealthTipsTable> {
  $$HealthTipsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HealthTipsTableOrderingComposer
    extends Composer<_$AppDatabase, $HealthTipsTable> {
  $$HealthTipsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HealthTipsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HealthTipsTable> {
  $$HealthTipsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$HealthTipsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HealthTipsTable,
          HealthTip,
          $$HealthTipsTableFilterComposer,
          $$HealthTipsTableOrderingComposer,
          $$HealthTipsTableAnnotationComposer,
          $$HealthTipsTableCreateCompanionBuilder,
          $$HealthTipsTableUpdateCompanionBuilder,
          (
            HealthTip,
            BaseReferences<_$AppDatabase, $HealthTipsTable, HealthTip>,
          ),
          HealthTip,
          PrefetchHooks Function()
        > {
  $$HealthTipsTableTableManager(_$AppDatabase db, $HealthTipsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HealthTipsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HealthTipsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HealthTipsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<String> source = const Value.absent(),
              }) => HealthTipsCompanion(
                id: id,
                category: category,
                title: title,
                content: content,
                source: source,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String category,
                required String title,
                required String content,
                required String source,
              }) => HealthTipsCompanion.insert(
                id: id,
                category: category,
                title: title,
                content: content,
                source: source,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HealthTipsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HealthTipsTable,
      HealthTip,
      $$HealthTipsTableFilterComposer,
      $$HealthTipsTableOrderingComposer,
      $$HealthTipsTableAnnotationComposer,
      $$HealthTipsTableCreateCompanionBuilder,
      $$HealthTipsTableUpdateCompanionBuilder,
      (HealthTip, BaseReferences<_$AppDatabase, $HealthTipsTable, HealthTip>),
      HealthTip,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$HealthConditionsTableTableManager get healthConditions =>
      $$HealthConditionsTableTableManager(_db, _db.healthConditions);
  $$DoctorVisitsTableTableManager get doctorVisits =>
      $$DoctorVisitsTableTableManager(_db, _db.doctorVisits);
  $$PrescriptionsTableTableManager get prescriptions =>
      $$PrescriptionsTableTableManager(_db, _db.prescriptions);
  $$TestReportsTableTableManager get testReports =>
      $$TestReportsTableTableManager(_db, _db.testReports);
  $$VitalReadingsTableTableManager get vitalReadings =>
      $$VitalReadingsTableTableManager(_db, _db.vitalReadings);
  $$PeriodEntriesTableTableManager get periodEntries =>
      $$PeriodEntriesTableTableManager(_db, _db.periodEntries);
  $$InsurancesTableTableManager get insurances =>
      $$InsurancesTableTableManager(_db, _db.insurances);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$HealthTipsTableTableManager get healthTips =>
      $$HealthTipsTableTableManager(_db, _db.healthTips);
}
