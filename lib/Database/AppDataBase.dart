import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'AppDataBase.g.dart';

class PlayListItem extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get listId => integer().nullable()();

  IntColumn get netId => integer().nullable()();

  TextColumn get imgUrl => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

class PlayListDetailItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get netId => integer().nullable()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  BoolColumn get isNet => boolean().withDefault(Constant(false))();

  TextColumn get imgUrl => text()();

  DateTimeColumn get createdAt =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

@DriftDatabase(tables: [PlayListDetailItems, PlayListItem])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from == 1) {
        await m.deleteTable('todo_items');
        await m.deleteTable('todo_category');
        await m.createTable(playListItem);
        await m.createTable(playListDetailItems);
      }
    },
    beforeOpen: (details) async {
      if (details.wasCreated) {
        print('Database created');
      } else if (details.hadUpgrade) {
        print(
            'Database upgraded from version ${details.versionBefore} to ${details.versionNow}');
      }
    },
  );
}