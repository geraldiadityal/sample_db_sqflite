

part of 'services.dart';

abstract class FloorServices{
  static Future<AppDatabase> openDatabase() async{
    return await $FloorAppDatabase.databaseBuilder('sample_floor.db').build();
  }

}