part of 'models.dart';

@entity
class Favorite {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String judul;
  final String body;
  final String? link;
  final String poster;

  Favorite({
    this.id,
    required this.judul,
    required this.body,
    required this.link,
    required this.poster,
  });
}
