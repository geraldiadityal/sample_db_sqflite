part of 'models.dart';

@entity
class Favorite{
  @primaryKey
  final int id;
  final String judul;
  final String body;
  final String link;
  final String poster;

  Favorite(this.id, this.judul, this.body,this.link, this.poster);
}