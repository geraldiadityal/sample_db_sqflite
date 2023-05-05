import 'package:sample_db_sqflite/models/models.dart';
import 'package:floor/floor.dart';

@dao
abstract class FavoritesRepo{
  @Query('SELECT * FROM Favorite')
  Future<List<Favorite>> findAllFavorite();

  @Query('SELECT judul FROM Favorite')
  Stream<List<String>> findJudulFavorite();

  @Query('SELECT * FROM Favorite WHERE judul = :judul')
  Stream<Favorite?>findFavoriteByTitle(String judul);

  @insert
  Future<void>insertNewFavorite(Favorite Favorite);
}