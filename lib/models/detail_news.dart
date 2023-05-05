part of 'models.dart';

class DetailNews {
  final String body;
  final String judul;
  final String poster;
  DetailNews(this.body, this.judul, this.poster);

  factory DetailNews.fromJson(Map<String, dynamic> json) => DetailNews(
        json['body']??'',
        json['judul']??'',
        json['poster']??'',
      );
}
