part of 'models.dart';
class News {
  String judul;
  String link;
  String poster;

  News(this.judul, this.link, this.poster);

  factory News.fromJson(Map<String, dynamic> json) => News(
        json['judul']??"",
        json['link']??"",
        json['poster']??"",
      );
}
