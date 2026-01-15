// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_database.dart';

// ignore_for_file: type=lint
class $MedicinesTable extends Medicines
    with TableInfo<$MedicinesTable, Medicine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicinesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _manufacturerMeta = const VerificationMeta(
    'manufacturer',
  );
  @override
  late final GeneratedColumn<String> manufacturer = GeneratedColumn<String>(
    'manufacturer',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _packSizeLabelMeta = const VerificationMeta(
    'packSizeLabel',
  );
  @override
  late final GeneratedColumn<String> packSizeLabel = GeneratedColumn<String>(
    'pack_size_label',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shortComposition1Meta = const VerificationMeta(
    'shortComposition1',
  );
  @override
  late final GeneratedColumn<String> shortComposition1 =
      GeneratedColumn<String>(
        'short_composition1',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _shortComposition2Meta = const VerificationMeta(
    'shortComposition2',
  );
  @override
  late final GeneratedColumn<String> shortComposition2 =
      GeneratedColumn<String>(
        'short_composition2',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _isDiscontinuedMeta = const VerificationMeta(
    'isDiscontinued',
  );
  @override
  late final GeneratedColumn<bool> isDiscontinued = GeneratedColumn<bool>(
    'is_discontinued',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_discontinued" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _searchKeyMeta = const VerificationMeta(
    'searchKey',
  );
  @override
  late final GeneratedColumn<String> searchKey = GeneratedColumn<String>(
    'search_key',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    price,
    manufacturer,
    type,
    packSizeLabel,
    shortComposition1,
    shortComposition2,
    isDiscontinued,
    searchKey,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medicines';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medicine> instance, {
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
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('manufacturer')) {
      context.handle(
        _manufacturerMeta,
        manufacturer.isAcceptableOrUnknown(
          data['manufacturer']!,
          _manufacturerMeta,
        ),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('pack_size_label')) {
      context.handle(
        _packSizeLabelMeta,
        packSizeLabel.isAcceptableOrUnknown(
          data['pack_size_label']!,
          _packSizeLabelMeta,
        ),
      );
    }
    if (data.containsKey('short_composition1')) {
      context.handle(
        _shortComposition1Meta,
        shortComposition1.isAcceptableOrUnknown(
          data['short_composition1']!,
          _shortComposition1Meta,
        ),
      );
    }
    if (data.containsKey('short_composition2')) {
      context.handle(
        _shortComposition2Meta,
        shortComposition2.isAcceptableOrUnknown(
          data['short_composition2']!,
          _shortComposition2Meta,
        ),
      );
    }
    if (data.containsKey('is_discontinued')) {
      context.handle(
        _isDiscontinuedMeta,
        isDiscontinued.isAcceptableOrUnknown(
          data['is_discontinued']!,
          _isDiscontinuedMeta,
        ),
      );
    }
    if (data.containsKey('search_key')) {
      context.handle(
        _searchKeyMeta,
        searchKey.isAcceptableOrUnknown(data['search_key']!, _searchKeyMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medicine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medicine(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      ),
      manufacturer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}manufacturer'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      packSizeLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pack_size_label'],
      ),
      shortComposition1: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_composition1'],
      ),
      shortComposition2: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_composition2'],
      ),
      isDiscontinued: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_discontinued'],
      )!,
      searchKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}search_key'],
      ),
    );
  }

  @override
  $MedicinesTable createAlias(String alias) {
    return $MedicinesTable(attachedDatabase, alias);
  }
}

class Medicine extends DataClass implements Insertable<Medicine> {
  final int id;
  final String name;
  final double? price;
  final String? manufacturer;
  final String? type;
  final String? packSizeLabel;
  final String? shortComposition1;
  final String? shortComposition2;
  final bool isDiscontinued;
  final String? searchKey;
  const Medicine({
    required this.id,
    required this.name,
    this.price,
    this.manufacturer,
    this.type,
    this.packSizeLabel,
    this.shortComposition1,
    this.shortComposition2,
    required this.isDiscontinued,
    this.searchKey,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || manufacturer != null) {
      map['manufacturer'] = Variable<String>(manufacturer);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || packSizeLabel != null) {
      map['pack_size_label'] = Variable<String>(packSizeLabel);
    }
    if (!nullToAbsent || shortComposition1 != null) {
      map['short_composition1'] = Variable<String>(shortComposition1);
    }
    if (!nullToAbsent || shortComposition2 != null) {
      map['short_composition2'] = Variable<String>(shortComposition2);
    }
    map['is_discontinued'] = Variable<bool>(isDiscontinued);
    if (!nullToAbsent || searchKey != null) {
      map['search_key'] = Variable<String>(searchKey);
    }
    return map;
  }

  MedicinesCompanion toCompanion(bool nullToAbsent) {
    return MedicinesCompanion(
      id: Value(id),
      name: Value(name),
      price: price == null && nullToAbsent
          ? const Value.absent()
          : Value(price),
      manufacturer: manufacturer == null && nullToAbsent
          ? const Value.absent()
          : Value(manufacturer),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      packSizeLabel: packSizeLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(packSizeLabel),
      shortComposition1: shortComposition1 == null && nullToAbsent
          ? const Value.absent()
          : Value(shortComposition1),
      shortComposition2: shortComposition2 == null && nullToAbsent
          ? const Value.absent()
          : Value(shortComposition2),
      isDiscontinued: Value(isDiscontinued),
      searchKey: searchKey == null && nullToAbsent
          ? const Value.absent()
          : Value(searchKey),
    );
  }

  factory fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medicine(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double?>(json['price']),
      manufacturer: serializer.fromJson<String?>(json['manufacturer']),
      type: serializer.fromJson<String?>(json['type']),
      packSizeLabel: serializer.fromJson<String?>(json['packSizeLabel']),
      shortComposition1: serializer.fromJson<String?>(
        json['shortComposition1'],
      ),
      shortComposition2: serializer.fromJson<String?>(
        json['shortComposition2'],
      ),
      isDiscontinued: serializer.fromJson<bool>(json['isDiscontinued']),
      searchKey: serializer.fromJson<String?>(json['searchKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double?>(price),
      'manufacturer': serializer.toJson<String?>(manufacturer),
      'type': serializer.toJson<String?>(type),
      'packSizeLabel': serializer.toJson<String?>(packSizeLabel),
      'shortComposition1': serializer.toJson<String?>(shortComposition1),
      'shortComposition2': serializer.toJson<String?>(shortComposition2),
      'isDiscontinued': serializer.toJson<bool>(isDiscontinued),
      'searchKey': serializer.toJson<String?>(searchKey),
    };
  }

  Medicine copyWith({
    int? id,
    String? name,
    Value<double?> price = const Value.absent(),
    Value<String?> manufacturer = const Value.absent(),
    Value<String?> type = const Value.absent(),
    Value<String?> packSizeLabel = const Value.absent(),
    Value<String?> shortComposition1 = const Value.absent(),
    Value<String?> shortComposition2 = const Value.absent(),
    bool? isDiscontinued,
    Value<String?> searchKey = const Value.absent(),
  }) => Medicine(
    id: id ?? this.id,
    name: name ?? this.name,
    price: price.present ? price.value : this.price,
    manufacturer: manufacturer.present ? manufacturer.value : this.manufacturer,
    type: type.present ? type.value : this.type,
    packSizeLabel: packSizeLabel.present
        ? packSizeLabel.value
        : this.packSizeLabel,
    shortComposition1: shortComposition1.present
        ? shortComposition1.value
        : this.shortComposition1,
    shortComposition2: shortComposition2.present
        ? shortComposition2.value
        : this.shortComposition2,
    isDiscontinued: isDiscontinued ?? this.isDiscontinued,
    searchKey: searchKey.present ? searchKey.value : this.searchKey,
  );
  Medicine copyWithCompanion(MedicinesCompanion data) {
    return Medicine(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      manufacturer: data.manufacturer.present
          ? data.manufacturer.value
          : this.manufacturer,
      type: data.type.present ? data.type.value : this.type,
      packSizeLabel: data.packSizeLabel.present
          ? data.packSizeLabel.value
          : this.packSizeLabel,
      shortComposition1: data.shortComposition1.present
          ? data.shortComposition1.value
          : this.shortComposition1,
      shortComposition2: data.shortComposition2.present
          ? data.shortComposition2.value
          : this.shortComposition2,
      isDiscontinued: data.isDiscontinued.present
          ? data.isDiscontinued.value
          : this.isDiscontinued,
      searchKey: data.searchKey.present ? data.searchKey.value : this.searchKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medicine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('type: $type, ')
          ..write('packSizeLabel: $packSizeLabel, ')
          ..write('shortComposition1: $shortComposition1, ')
          ..write('shortComposition2: $shortComposition2, ')
          ..write('isDiscontinued: $isDiscontinued, ')
          ..write('searchKey: $searchKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    price,
    manufacturer,
    type,
    packSizeLabel,
    shortComposition1,
    shortComposition2,
    isDiscontinued,
    searchKey,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medicine &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.manufacturer == this.manufacturer &&
          other.type == this.type &&
          other.packSizeLabel == this.packSizeLabel &&
          other.shortComposition1 == this.shortComposition1 &&
          other.shortComposition2 == this.shortComposition2 &&
          other.isDiscontinued == this.isDiscontinued &&
          other.searchKey == this.searchKey);
}

class MedicinesCompanion extends UpdateCompanion<Medicine> {
  final Value<int> id;
  final Value<String> name;
  final Value<double?> price;
  final Value<String?> manufacturer;
  final Value<String?> type;
  final Value<String?> packSizeLabel;
  final Value<String?> shortComposition1;
  final Value<String?> shortComposition2;
  final Value<bool> isDiscontinued;
  final Value<String?> searchKey;
  const MedicinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.manufacturer = const Value.absent(),
    this.type = const Value.absent(),
    this.packSizeLabel = const Value.absent(),
    this.shortComposition1 = const Value.absent(),
    this.shortComposition2 = const Value.absent(),
    this.isDiscontinued = const Value.absent(),
    this.searchKey = const Value.absent(),
  });
  MedicinesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.price = const Value.absent(),
    this.manufacturer = const Value.absent(),
    this.type = const Value.absent(),
    this.packSizeLabel = const Value.absent(),
    this.shortComposition1 = const Value.absent(),
    this.shortComposition2 = const Value.absent(),
    this.isDiscontinued = const Value.absent(),
    this.searchKey = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Medicine> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<String>? manufacturer,
    Expression<String>? type,
    Expression<String>? packSizeLabel,
    Expression<String>? shortComposition1,
    Expression<String>? shortComposition2,
    Expression<bool>? isDiscontinued,
    Expression<String>? searchKey,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (manufacturer != null) 'manufacturer': manufacturer,
      if (type != null) 'type': type,
      if (packSizeLabel != null) 'pack_size_label': packSizeLabel,
      if (shortComposition1 != null) 'short_composition1': shortComposition1,
      if (shortComposition2 != null) 'short_composition2': shortComposition2,
      if (isDiscontinued != null) 'is_discontinued': isDiscontinued,
      if (searchKey != null) 'search_key': searchKey,
    });
  }

  MedicinesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double?>? price,
    Value<String?>? manufacturer,
    Value<String?>? type,
    Value<String?>? packSizeLabel,
    Value<String?>? shortComposition1,
    Value<String?>? shortComposition2,
    Value<bool>? isDiscontinued,
    Value<String?>? searchKey,
  }) {
    return MedicinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      manufacturer: manufacturer ?? this.manufacturer,
      type: type ?? this.type,
      packSizeLabel: packSizeLabel ?? this.packSizeLabel,
      shortComposition1: shortComposition1 ?? this.shortComposition1,
      shortComposition2: shortComposition2 ?? this.shortComposition2,
      isDiscontinued: isDiscontinued ?? this.isDiscontinued,
      searchKey: searchKey ?? this.searchKey,
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
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (manufacturer.present) {
      map['manufacturer'] = Variable<String>(manufacturer.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (packSizeLabel.present) {
      map['pack_size_label'] = Variable<String>(packSizeLabel.value);
    }
    if (shortComposition1.present) {
      map['short_composition1'] = Variable<String>(shortComposition1.value);
    }
    if (shortComposition2.present) {
      map['short_composition2'] = Variable<String>(shortComposition2.value);
    }
    if (isDiscontinued.present) {
      map['is_discontinued'] = Variable<bool>(isDiscontinued.value);
    }
    if (searchKey.present) {
      map['search_key'] = Variable<String>(searchKey.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('manufacturer: $manufacturer, ')
          ..write('type: $type, ')
          ..write('packSizeLabel: $packSizeLabel, ')
          ..write('shortComposition1: $shortComposition1, ')
          ..write('shortComposition2: $shortComposition2, ')
          ..write('isDiscontinued: $isDiscontinued, ')
          ..write('searchKey: $searchKey')
          ..write(')'))
        .toString();
  }
}

abstract class _$MedicineDatabase extends GeneratedDatabase {
  _$MedicineDatabase(QueryExecutor e) : super(e);
  $MedicineDatabaseManager get managers => $MedicineDatabaseManager(this);
  late final $MedicinesTable medicines = $MedicinesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [medicines];
}

typedef $$MedicinesTableCreateCompanionBuilder =
    MedicinesCompanion Function({
      Value<int> id,
      required String name,
      Value<double?> price,
      Value<String?> manufacturer,
      Value<String?> type,
      Value<String?> packSizeLabel,
      Value<String?> shortComposition1,
      Value<String?> shortComposition2,
      Value<bool> isDiscontinued,
      Value<String?> searchKey,
    });
typedef $$MedicinesTableUpdateCompanionBuilder =
    MedicinesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double?> price,
      Value<String?> manufacturer,
      Value<String?> type,
      Value<String?> packSizeLabel,
      Value<String?> shortComposition1,
      Value<String?> shortComposition2,
      Value<bool> isDiscontinued,
      Value<String?> searchKey,
    });

class $$MedicinesTableFilterComposer
    extends Composer<_$MedicineDatabase, $MedicinesTable> {
  $$MedicinesTableFilterComposer({
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

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get packSizeLabel => $composableBuilder(
    column: $table.packSizeLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortComposition1 => $composableBuilder(
    column: $table.shortComposition1,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortComposition2 => $composableBuilder(
    column: $table.shortComposition2,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDiscontinued => $composableBuilder(
    column: $table.isDiscontinued,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get searchKey => $composableBuilder(
    column: $table.searchKey,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MedicinesTableOrderingComposer
    extends Composer<_$MedicineDatabase, $MedicinesTable> {
  $$MedicinesTableOrderingComposer({
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

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get packSizeLabel => $composableBuilder(
    column: $table.packSizeLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortComposition1 => $composableBuilder(
    column: $table.shortComposition1,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortComposition2 => $composableBuilder(
    column: $table.shortComposition2,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDiscontinued => $composableBuilder(
    column: $table.isDiscontinued,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get searchKey => $composableBuilder(
    column: $table.searchKey,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MedicinesTableAnnotationComposer
    extends Composer<_$MedicineDatabase, $MedicinesTable> {
  $$MedicinesTableAnnotationComposer({
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

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get manufacturer => $composableBuilder(
    column: $table.manufacturer,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get packSizeLabel => $composableBuilder(
    column: $table.packSizeLabel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shortComposition1 => $composableBuilder(
    column: $table.shortComposition1,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shortComposition2 => $composableBuilder(
    column: $table.shortComposition2,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDiscontinued => $composableBuilder(
    column: $table.isDiscontinued,
    builder: (column) => column,
  );

  GeneratedColumn<String> get searchKey =>
      $composableBuilder(column: $table.searchKey, builder: (column) => column);
}

class $$MedicinesTableTableManager
    extends
        RootTableManager<
          _$MedicineDatabase,
          $MedicinesTable,
          Medicine,
          $$MedicinesTableFilterComposer,
          $$MedicinesTableOrderingComposer,
          $$MedicinesTableAnnotationComposer,
          $$MedicinesTableCreateCompanionBuilder,
          $$MedicinesTableUpdateCompanionBuilder,
          (
            Medicine,
            BaseReferences<_$MedicineDatabase, $MedicinesTable, Medicine>,
          ),
          Medicine,
          PrefetchHooks Function()
        > {
  $$MedicinesTableTableManager(_$MedicineDatabase db, $MedicinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double?> price = const Value.absent(),
                Value<String?> manufacturer = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> packSizeLabel = const Value.absent(),
                Value<String?> shortComposition1 = const Value.absent(),
                Value<String?> shortComposition2 = const Value.absent(),
                Value<bool> isDiscontinued = const Value.absent(),
                Value<String?> searchKey = const Value.absent(),
              }) => MedicinesCompanion(
                id: id,
                name: name,
                price: price,
                manufacturer: manufacturer,
                type: type,
                packSizeLabel: packSizeLabel,
                shortComposition1: shortComposition1,
                shortComposition2: shortComposition2,
                isDiscontinued: isDiscontinued,
                searchKey: searchKey,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<double?> price = const Value.absent(),
                Value<String?> manufacturer = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> packSizeLabel = const Value.absent(),
                Value<String?> shortComposition1 = const Value.absent(),
                Value<String?> shortComposition2 = const Value.absent(),
                Value<bool> isDiscontinued = const Value.absent(),
                Value<String?> searchKey = const Value.absent(),
              }) => MedicinesCompanion.insert(
                id: id,
                name: name,
                price: price,
                manufacturer: manufacturer,
                type: type,
                packSizeLabel: packSizeLabel,
                shortComposition1: shortComposition1,
                shortComposition2: shortComposition2,
                isDiscontinued: isDiscontinued,
                searchKey: searchKey,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MedicinesTableProcessedTableManager =
    ProcessedTableManager<
      _$MedicineDatabase,
      $MedicinesTable,
      Medicine,
      $$MedicinesTableFilterComposer,
      $$MedicinesTableOrderingComposer,
      $$MedicinesTableAnnotationComposer,
      $$MedicinesTableCreateCompanionBuilder,
      $$MedicinesTableUpdateCompanionBuilder,
      (Medicine, BaseReferences<_$MedicineDatabase, $MedicinesTable, Medicine>),
      Medicine,
      PrefetchHooks Function()
    >;

class $MedicineDatabaseManager {
  final _$MedicineDatabase _db;
  $MedicineDatabaseManager(this._db);
  $$MedicinesTableTableManager get medicines =>
      $$MedicinesTableTableManager(_db, _db.medicines);
}
