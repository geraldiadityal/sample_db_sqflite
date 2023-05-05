// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FavoritesRepo? _favoriteRepoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Favorite` (`id` INTEGER NOT NULL, `judul` TEXT NOT NULL, `body` TEXT NOT NULL, `link` TEXT NOT NULL, `poster` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoritesRepo get favoriteRepo {
    return _favoriteRepoInstance ??= _$FavoritesRepo(database, changeListener);
  }
}

class _$FavoritesRepo extends FavoritesRepo {
  _$FavoritesRepo(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _favoriteInsertionAdapter = InsertionAdapter(
            database,
            'Favorite',
            (Favorite item) => <String, Object?>{
                  'id': item.id,
                  'judul': item.judul,
                  'body': item.body,
                  'link': item.link,
                  'poster': item.poster
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Favorite> _favoriteInsertionAdapter;

  @override
  Future<List<Favorite>> findAllFavorite() async {
    return _queryAdapter.queryList('SELECT * FROM Favorite',
        mapper: (Map<String, Object?> row) => Favorite(
            row['id'] as int,
            row['judul'] as String,
            row['body'] as String,
            row['link'] as String,
            row['poster'] as String));
  }

  @override
  Stream<List<String>> findJudulFavorite() {
    return _queryAdapter.queryListStream('SELECT judul FROM Favorite',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'Favorite',
        isView: false);
  }

  @override
  Stream<Favorite?> findFavoriteByTitle(String judul) {
    return _queryAdapter.queryStream('SELECT * FROM Favorite WHERE judul = ?1',
        mapper: (Map<String, Object?> row) => Favorite(
            row['id'] as int,
            row['judul'] as String,
            row['body'] as String,
            row['link'] as String,
            row['poster'] as String),
        arguments: [judul],
        queryableName: 'Favorite',
        isView: false);
  }

  @override
  Future<void> insertNewFavorite(Favorite Favorite) async {
    await _favoriteInsertionAdapter.insert(Favorite, OnConflictStrategy.abort);
  }
}
