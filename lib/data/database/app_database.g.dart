// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PasswordTableTable extends PasswordTable
    with TableInfo<$PasswordTableTable, password_table> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PasswordTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _passwordIdMeta = const VerificationMeta(
    'passwordId',
  );
  @override
  late final GeneratedColumn<int> passwordId = GeneratedColumn<int>(
    'password_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hintMeta = const VerificationMeta('hint');
  @override
  late final GeneratedColumn<String> hint = GeneratedColumn<String>(
    'hint',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [passwordId, password, hint];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'password_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<password_table> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('password_id')) {
      context.handle(
        _passwordIdMeta,
        passwordId.isAcceptableOrUnknown(data['password_id']!, _passwordIdMeta),
      );
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('hint')) {
      context.handle(
        _hintMeta,
        hint.isAcceptableOrUnknown(data['hint']!, _hintMeta),
      );
    } else if (isInserting) {
      context.missing(_hintMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {passwordId};
  @override
  password_table map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return password_table(
      passwordId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}password_id'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      hint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hint'],
      )!,
    );
  }

  @override
  $PasswordTableTable createAlias(String alias) {
    return $PasswordTableTable(attachedDatabase, alias);
  }
}

class password_table extends DataClass implements Insertable<password_table> {
  final int passwordId;
  final String password;
  final String hint;
  const password_table({
    required this.passwordId,
    required this.password,
    required this.hint,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['password_id'] = Variable<int>(passwordId);
    map['password'] = Variable<String>(password);
    map['hint'] = Variable<String>(hint);
    return map;
  }

  PasswordTableCompanion toCompanion(bool nullToAbsent) {
    return PasswordTableCompanion(
      passwordId: Value(passwordId),
      password: Value(password),
      hint: Value(hint),
    );
  }

  factory password_table.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return password_table(
      passwordId: serializer.fromJson<int>(json['passwordId']),
      password: serializer.fromJson<String>(json['password']),
      hint: serializer.fromJson<String>(json['hint']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'passwordId': serializer.toJson<int>(passwordId),
      'password': serializer.toJson<String>(password),
      'hint': serializer.toJson<String>(hint),
    };
  }

  password_table copyWith({int? passwordId, String? password, String? hint}) =>
      password_table(
        passwordId: passwordId ?? this.passwordId,
        password: password ?? this.password,
        hint: hint ?? this.hint,
      );
  password_table copyWithCompanion(PasswordTableCompanion data) {
    return password_table(
      passwordId: data.passwordId.present
          ? data.passwordId.value
          : this.passwordId,
      password: data.password.present ? data.password.value : this.password,
      hint: data.hint.present ? data.hint.value : this.hint,
    );
  }

  @override
  String toString() {
    return (StringBuffer('password_table(')
          ..write('passwordId: $passwordId, ')
          ..write('password: $password, ')
          ..write('hint: $hint')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(passwordId, password, hint);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is password_table &&
          other.passwordId == this.passwordId &&
          other.password == this.password &&
          other.hint == this.hint);
}

class PasswordTableCompanion extends UpdateCompanion<password_table> {
  final Value<int> passwordId;
  final Value<String> password;
  final Value<String> hint;
  const PasswordTableCompanion({
    this.passwordId = const Value.absent(),
    this.password = const Value.absent(),
    this.hint = const Value.absent(),
  });
  PasswordTableCompanion.insert({
    this.passwordId = const Value.absent(),
    required String password,
    required String hint,
  }) : password = Value(password),
       hint = Value(hint);
  static Insertable<password_table> custom({
    Expression<int>? passwordId,
    Expression<String>? password,
    Expression<String>? hint,
  }) {
    return RawValuesInsertable({
      if (passwordId != null) 'password_id': passwordId,
      if (password != null) 'password': password,
      if (hint != null) 'hint': hint,
    });
  }

  PasswordTableCompanion copyWith({
    Value<int>? passwordId,
    Value<String>? password,
    Value<String>? hint,
  }) {
    return PasswordTableCompanion(
      passwordId: passwordId ?? this.passwordId,
      password: password ?? this.password,
      hint: hint ?? this.hint,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (passwordId.present) {
      map['password_id'] = Variable<int>(passwordId.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (hint.present) {
      map['hint'] = Variable<String>(hint.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PasswordTableCompanion(')
          ..write('passwordId: $passwordId, ')
          ..write('password: $password, ')
          ..write('hint: $hint')
          ..write(')'))
        .toString();
  }
}

class $NoteTableTable extends NoteTable
    with TableInfo<$NoteTableTable, note_table> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _noteIdMeta = const VerificationMeta('noteId');
  @override
  late final GeneratedColumn<int> noteId = GeneratedColumn<int>(
    'note_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _noteCreateDateMeta = const VerificationMeta(
    'noteCreateDate',
  );
  @override
  late final GeneratedColumn<String> noteCreateDate = GeneratedColumn<String>(
    'note_create_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteTitleMeta = const VerificationMeta(
    'noteTitle',
  );
  @override
  late final GeneratedColumn<String> noteTitle = GeneratedColumn<String>(
    'note_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteContentMeta = const VerificationMeta(
    'noteContent',
  );
  @override
  late final GeneratedColumn<String> noteContent = GeneratedColumn<String>(
    'note_content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteCategoryMeta = const VerificationMeta(
    'noteCategory',
  );
  @override
  late final GeneratedColumn<int> noteCategory = GeneratedColumn<int>(
    'note_category',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteLastEditDateMeta = const VerificationMeta(
    'noteLastEditDate',
  );
  @override
  late final GeneratedColumn<String> noteLastEditDate = GeneratedColumn<String>(
    'note_last_edit_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    noteId,
    noteCreateDate,
    noteTitle,
    noteContent,
    noteCategory,
    noteLastEditDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<note_table> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('note_id')) {
      context.handle(
        _noteIdMeta,
        noteId.isAcceptableOrUnknown(data['note_id']!, _noteIdMeta),
      );
    }
    if (data.containsKey('note_create_date')) {
      context.handle(
        _noteCreateDateMeta,
        noteCreateDate.isAcceptableOrUnknown(
          data['note_create_date']!,
          _noteCreateDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_noteCreateDateMeta);
    }
    if (data.containsKey('note_title')) {
      context.handle(
        _noteTitleMeta,
        noteTitle.isAcceptableOrUnknown(data['note_title']!, _noteTitleMeta),
      );
    } else if (isInserting) {
      context.missing(_noteTitleMeta);
    }
    if (data.containsKey('note_content')) {
      context.handle(
        _noteContentMeta,
        noteContent.isAcceptableOrUnknown(
          data['note_content']!,
          _noteContentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_noteContentMeta);
    }
    if (data.containsKey('note_category')) {
      context.handle(
        _noteCategoryMeta,
        noteCategory.isAcceptableOrUnknown(
          data['note_category']!,
          _noteCategoryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_noteCategoryMeta);
    }
    if (data.containsKey('note_last_edit_date')) {
      context.handle(
        _noteLastEditDateMeta,
        noteLastEditDate.isAcceptableOrUnknown(
          data['note_last_edit_date']!,
          _noteLastEditDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_noteLastEditDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {noteId};
  @override
  note_table map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return note_table(
      noteId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}note_id'],
      )!,
      noteCreateDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_create_date'],
      )!,
      noteTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_title'],
      )!,
      noteContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_content'],
      )!,
      noteCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}note_category'],
      )!,
      noteLastEditDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note_last_edit_date'],
      )!,
    );
  }

  @override
  $NoteTableTable createAlias(String alias) {
    return $NoteTableTable(attachedDatabase, alias);
  }
}

class note_table extends DataClass implements Insertable<note_table> {
  final int noteId;
  final String noteCreateDate;
  final String noteTitle;
  final String noteContent;
  final int noteCategory;
  final String noteLastEditDate;
  const note_table({
    required this.noteId,
    required this.noteCreateDate,
    required this.noteTitle,
    required this.noteContent,
    required this.noteCategory,
    required this.noteLastEditDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['note_id'] = Variable<int>(noteId);
    map['note_create_date'] = Variable<String>(noteCreateDate);
    map['note_title'] = Variable<String>(noteTitle);
    map['note_content'] = Variable<String>(noteContent);
    map['note_category'] = Variable<int>(noteCategory);
    map['note_last_edit_date'] = Variable<String>(noteLastEditDate);
    return map;
  }

  NoteTableCompanion toCompanion(bool nullToAbsent) {
    return NoteTableCompanion(
      noteId: Value(noteId),
      noteCreateDate: Value(noteCreateDate),
      noteTitle: Value(noteTitle),
      noteContent: Value(noteContent),
      noteCategory: Value(noteCategory),
      noteLastEditDate: Value(noteLastEditDate),
    );
  }

  factory note_table.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return note_table(
      noteId: serializer.fromJson<int>(json['noteId']),
      noteCreateDate: serializer.fromJson<String>(json['noteCreateDate']),
      noteTitle: serializer.fromJson<String>(json['noteTitle']),
      noteContent: serializer.fromJson<String>(json['noteContent']),
      noteCategory: serializer.fromJson<int>(json['noteCategory']),
      noteLastEditDate: serializer.fromJson<String>(json['noteLastEditDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'noteId': serializer.toJson<int>(noteId),
      'noteCreateDate': serializer.toJson<String>(noteCreateDate),
      'noteTitle': serializer.toJson<String>(noteTitle),
      'noteContent': serializer.toJson<String>(noteContent),
      'noteCategory': serializer.toJson<int>(noteCategory),
      'noteLastEditDate': serializer.toJson<String>(noteLastEditDate),
    };
  }

  note_table copyWith({
    int? noteId,
    String? noteCreateDate,
    String? noteTitle,
    String? noteContent,
    int? noteCategory,
    String? noteLastEditDate,
  }) => note_table(
    noteId: noteId ?? this.noteId,
    noteCreateDate: noteCreateDate ?? this.noteCreateDate,
    noteTitle: noteTitle ?? this.noteTitle,
    noteContent: noteContent ?? this.noteContent,
    noteCategory: noteCategory ?? this.noteCategory,
    noteLastEditDate: noteLastEditDate ?? this.noteLastEditDate,
  );
  note_table copyWithCompanion(NoteTableCompanion data) {
    return note_table(
      noteId: data.noteId.present ? data.noteId.value : this.noteId,
      noteCreateDate: data.noteCreateDate.present
          ? data.noteCreateDate.value
          : this.noteCreateDate,
      noteTitle: data.noteTitle.present ? data.noteTitle.value : this.noteTitle,
      noteContent: data.noteContent.present
          ? data.noteContent.value
          : this.noteContent,
      noteCategory: data.noteCategory.present
          ? data.noteCategory.value
          : this.noteCategory,
      noteLastEditDate: data.noteLastEditDate.present
          ? data.noteLastEditDate.value
          : this.noteLastEditDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('note_table(')
          ..write('noteId: $noteId, ')
          ..write('noteCreateDate: $noteCreateDate, ')
          ..write('noteTitle: $noteTitle, ')
          ..write('noteContent: $noteContent, ')
          ..write('noteCategory: $noteCategory, ')
          ..write('noteLastEditDate: $noteLastEditDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    noteId,
    noteCreateDate,
    noteTitle,
    noteContent,
    noteCategory,
    noteLastEditDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is note_table &&
          other.noteId == this.noteId &&
          other.noteCreateDate == this.noteCreateDate &&
          other.noteTitle == this.noteTitle &&
          other.noteContent == this.noteContent &&
          other.noteCategory == this.noteCategory &&
          other.noteLastEditDate == this.noteLastEditDate);
}

class NoteTableCompanion extends UpdateCompanion<note_table> {
  final Value<int> noteId;
  final Value<String> noteCreateDate;
  final Value<String> noteTitle;
  final Value<String> noteContent;
  final Value<int> noteCategory;
  final Value<String> noteLastEditDate;
  const NoteTableCompanion({
    this.noteId = const Value.absent(),
    this.noteCreateDate = const Value.absent(),
    this.noteTitle = const Value.absent(),
    this.noteContent = const Value.absent(),
    this.noteCategory = const Value.absent(),
    this.noteLastEditDate = const Value.absent(),
  });
  NoteTableCompanion.insert({
    this.noteId = const Value.absent(),
    required String noteCreateDate,
    required String noteTitle,
    required String noteContent,
    required int noteCategory,
    required String noteLastEditDate,
  }) : noteCreateDate = Value(noteCreateDate),
       noteTitle = Value(noteTitle),
       noteContent = Value(noteContent),
       noteCategory = Value(noteCategory),
       noteLastEditDate = Value(noteLastEditDate);
  static Insertable<note_table> custom({
    Expression<int>? noteId,
    Expression<String>? noteCreateDate,
    Expression<String>? noteTitle,
    Expression<String>? noteContent,
    Expression<int>? noteCategory,
    Expression<String>? noteLastEditDate,
  }) {
    return RawValuesInsertable({
      if (noteId != null) 'note_id': noteId,
      if (noteCreateDate != null) 'note_create_date': noteCreateDate,
      if (noteTitle != null) 'note_title': noteTitle,
      if (noteContent != null) 'note_content': noteContent,
      if (noteCategory != null) 'note_category': noteCategory,
      if (noteLastEditDate != null) 'note_last_edit_date': noteLastEditDate,
    });
  }

  NoteTableCompanion copyWith({
    Value<int>? noteId,
    Value<String>? noteCreateDate,
    Value<String>? noteTitle,
    Value<String>? noteContent,
    Value<int>? noteCategory,
    Value<String>? noteLastEditDate,
  }) {
    return NoteTableCompanion(
      noteId: noteId ?? this.noteId,
      noteCreateDate: noteCreateDate ?? this.noteCreateDate,
      noteTitle: noteTitle ?? this.noteTitle,
      noteContent: noteContent ?? this.noteContent,
      noteCategory: noteCategory ?? this.noteCategory,
      noteLastEditDate: noteLastEditDate ?? this.noteLastEditDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (noteId.present) {
      map['note_id'] = Variable<int>(noteId.value);
    }
    if (noteCreateDate.present) {
      map['note_create_date'] = Variable<String>(noteCreateDate.value);
    }
    if (noteTitle.present) {
      map['note_title'] = Variable<String>(noteTitle.value);
    }
    if (noteContent.present) {
      map['note_content'] = Variable<String>(noteContent.value);
    }
    if (noteCategory.present) {
      map['note_category'] = Variable<int>(noteCategory.value);
    }
    if (noteLastEditDate.present) {
      map['note_last_edit_date'] = Variable<String>(noteLastEditDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteTableCompanion(')
          ..write('noteId: $noteId, ')
          ..write('noteCreateDate: $noteCreateDate, ')
          ..write('noteTitle: $noteTitle, ')
          ..write('noteContent: $noteContent, ')
          ..write('noteCategory: $noteCategory, ')
          ..write('noteLastEditDate: $noteLastEditDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PasswordTableTable passwordTable = $PasswordTableTable(this);
  late final $NoteTableTable noteTable = $NoteTableTable(this);
  late final PasswordDao passwordDao = PasswordDao(this as AppDatabase);
  late final NoteDao noteDao = NoteDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    passwordTable,
    noteTable,
  ];
}

typedef $$PasswordTableTableCreateCompanionBuilder =
    PasswordTableCompanion Function({
      Value<int> passwordId,
      required String password,
      required String hint,
    });
typedef $$PasswordTableTableUpdateCompanionBuilder =
    PasswordTableCompanion Function({
      Value<int> passwordId,
      Value<String> password,
      Value<String> hint,
    });

class $$PasswordTableTableFilterComposer
    extends Composer<_$AppDatabase, $PasswordTableTable> {
  $$PasswordTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get passwordId => $composableBuilder(
    column: $table.passwordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hint => $composableBuilder(
    column: $table.hint,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PasswordTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PasswordTableTable> {
  $$PasswordTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get passwordId => $composableBuilder(
    column: $table.passwordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hint => $composableBuilder(
    column: $table.hint,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PasswordTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PasswordTableTable> {
  $$PasswordTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get passwordId => $composableBuilder(
    column: $table.passwordId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get hint =>
      $composableBuilder(column: $table.hint, builder: (column) => column);
}

class $$PasswordTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PasswordTableTable,
          password_table,
          $$PasswordTableTableFilterComposer,
          $$PasswordTableTableOrderingComposer,
          $$PasswordTableTableAnnotationComposer,
          $$PasswordTableTableCreateCompanionBuilder,
          $$PasswordTableTableUpdateCompanionBuilder,
          (
            password_table,
            BaseReferences<_$AppDatabase, $PasswordTableTable, password_table>,
          ),
          password_table,
          PrefetchHooks Function()
        > {
  $$PasswordTableTableTableManager(_$AppDatabase db, $PasswordTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PasswordTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PasswordTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PasswordTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> passwordId = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> hint = const Value.absent(),
              }) => PasswordTableCompanion(
                passwordId: passwordId,
                password: password,
                hint: hint,
              ),
          createCompanionCallback:
              ({
                Value<int> passwordId = const Value.absent(),
                required String password,
                required String hint,
              }) => PasswordTableCompanion.insert(
                passwordId: passwordId,
                password: password,
                hint: hint,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PasswordTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PasswordTableTable,
      password_table,
      $$PasswordTableTableFilterComposer,
      $$PasswordTableTableOrderingComposer,
      $$PasswordTableTableAnnotationComposer,
      $$PasswordTableTableCreateCompanionBuilder,
      $$PasswordTableTableUpdateCompanionBuilder,
      (
        password_table,
        BaseReferences<_$AppDatabase, $PasswordTableTable, password_table>,
      ),
      password_table,
      PrefetchHooks Function()
    >;
typedef $$NoteTableTableCreateCompanionBuilder =
    NoteTableCompanion Function({
      Value<int> noteId,
      required String noteCreateDate,
      required String noteTitle,
      required String noteContent,
      required int noteCategory,
      required String noteLastEditDate,
    });
typedef $$NoteTableTableUpdateCompanionBuilder =
    NoteTableCompanion Function({
      Value<int> noteId,
      Value<String> noteCreateDate,
      Value<String> noteTitle,
      Value<String> noteContent,
      Value<int> noteCategory,
      Value<String> noteLastEditDate,
    });

class $$NoteTableTableFilterComposer
    extends Composer<_$AppDatabase, $NoteTableTable> {
  $$NoteTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get noteId => $composableBuilder(
    column: $table.noteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noteCreateDate => $composableBuilder(
    column: $table.noteCreateDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noteTitle => $composableBuilder(
    column: $table.noteTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noteContent => $composableBuilder(
    column: $table.noteContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get noteCategory => $composableBuilder(
    column: $table.noteCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get noteLastEditDate => $composableBuilder(
    column: $table.noteLastEditDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NoteTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NoteTableTable> {
  $$NoteTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get noteId => $composableBuilder(
    column: $table.noteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteCreateDate => $composableBuilder(
    column: $table.noteCreateDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteTitle => $composableBuilder(
    column: $table.noteTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteContent => $composableBuilder(
    column: $table.noteContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get noteCategory => $composableBuilder(
    column: $table.noteCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get noteLastEditDate => $composableBuilder(
    column: $table.noteLastEditDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NoteTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteTableTable> {
  $$NoteTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get noteId =>
      $composableBuilder(column: $table.noteId, builder: (column) => column);

  GeneratedColumn<String> get noteCreateDate => $composableBuilder(
    column: $table.noteCreateDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get noteTitle =>
      $composableBuilder(column: $table.noteTitle, builder: (column) => column);

  GeneratedColumn<String> get noteContent => $composableBuilder(
    column: $table.noteContent,
    builder: (column) => column,
  );

  GeneratedColumn<int> get noteCategory => $composableBuilder(
    column: $table.noteCategory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get noteLastEditDate => $composableBuilder(
    column: $table.noteLastEditDate,
    builder: (column) => column,
  );
}

class $$NoteTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NoteTableTable,
          note_table,
          $$NoteTableTableFilterComposer,
          $$NoteTableTableOrderingComposer,
          $$NoteTableTableAnnotationComposer,
          $$NoteTableTableCreateCompanionBuilder,
          $$NoteTableTableUpdateCompanionBuilder,
          (
            note_table,
            BaseReferences<_$AppDatabase, $NoteTableTable, note_table>,
          ),
          note_table,
          PrefetchHooks Function()
        > {
  $$NoteTableTableTableManager(_$AppDatabase db, $NoteTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> noteId = const Value.absent(),
                Value<String> noteCreateDate = const Value.absent(),
                Value<String> noteTitle = const Value.absent(),
                Value<String> noteContent = const Value.absent(),
                Value<int> noteCategory = const Value.absent(),
                Value<String> noteLastEditDate = const Value.absent(),
              }) => NoteTableCompanion(
                noteId: noteId,
                noteCreateDate: noteCreateDate,
                noteTitle: noteTitle,
                noteContent: noteContent,
                noteCategory: noteCategory,
                noteLastEditDate: noteLastEditDate,
              ),
          createCompanionCallback:
              ({
                Value<int> noteId = const Value.absent(),
                required String noteCreateDate,
                required String noteTitle,
                required String noteContent,
                required int noteCategory,
                required String noteLastEditDate,
              }) => NoteTableCompanion.insert(
                noteId: noteId,
                noteCreateDate: noteCreateDate,
                noteTitle: noteTitle,
                noteContent: noteContent,
                noteCategory: noteCategory,
                noteLastEditDate: noteLastEditDate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NoteTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NoteTableTable,
      note_table,
      $$NoteTableTableFilterComposer,
      $$NoteTableTableOrderingComposer,
      $$NoteTableTableAnnotationComposer,
      $$NoteTableTableCreateCompanionBuilder,
      $$NoteTableTableUpdateCompanionBuilder,
      (note_table, BaseReferences<_$AppDatabase, $NoteTableTable, note_table>),
      note_table,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PasswordTableTableTableManager get passwordTable =>
      $$PasswordTableTableTableManager(_db, _db.passwordTable);
  $$NoteTableTableTableManager get noteTable =>
      $$NoteTableTableTableManager(_db, _db.noteTable);
}
