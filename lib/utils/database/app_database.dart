import 'package:floor/floor.dart';
import 'package:sample_db_sqflite/utils/repository/favorites_repo.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'package:sample_db_sqflite/models/models.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [
  Favorite,
])
abstract class AppDatabase extends FloorDatabase {
  FavoritesRepo get favoriteRepo;
}
