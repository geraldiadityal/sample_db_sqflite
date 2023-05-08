import 'package:sample_db_sqflite/models/detail_news/detail_news.dart';
import 'package:sample_db_sqflite/models/models.dart';
import 'package:sample_db_sqflite/utils/database/app_database.dart';

abstract class LocalDatabase {
  static Future<AppDatabase> openDb() async {
    return await $FloorAppDatabase.databaseBuilder('sample_news.db').build();
  }

  static Future<void> addFavorite(DataDetail dataDetail) async {
    AppDatabase db = await openDb();
    Favorite favorite = Favorite(
      judul: dataDetail.judul!,
      body: dataDetail.body!,
      link: dataDetail.link,
      poster: dataDetail.poster!,
    );
    return await db.favoriteRepo.insertNewFavorite(favorite);
  }

  static Future<List<Favorite>> getFavorite() async {
    AppDatabase db = await openDb();
    return db.favoriteRepo.findAllFavorite();
  }

  static Future deleteFavoriteById(int id) async {
    AppDatabase db = await openDb();
    Favorite? favorite = await db.favoriteRepo.findFavoriteById(id);
    if (favorite != null) {
      return await db.favoriteRepo.deleteById(id);
    }
  }

  static Future deleteFavorite(Favorite favorite) async {
    AppDatabase db = await openDb();
    return await db.favoriteRepo.deleteFavorite(favorite);
  }
}
