import 'package:sample_db_sqflite/models/models.dart';
import 'package:floor/floor.dart';

@dao
abstract class FavoritesRepo{
  @Query('SELECT * FROM Favorite')
  Future<List<Favorite>> findAllFavorite();

  @Query('SELECT judul FROM Favorite')
  Future<List<String>> findJudulFavorite();

  @Query('SELECT * FROM Favorite where id = :id')
  Future<Favorite?> findFavoriteById(int id);
  

  @Query('SELECT * FROM Favorite WHERE judul = :judul')
  Stream<Favorite?>findFavoriteByTitle(String judul);

  @insert
  Future<void>insertNewFavorite(Favorite Favorite);


  @delete
  Future<void>deleteFavorite(Favorite Favorite);

  @Query('DELETE FROM Favorite where id = :id')
  Future<void> deleteById(int id);
}