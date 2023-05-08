

import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';


@JsonSerializable()
class DataNews {
  List<News>? data;
  int? length;
  int? status;

  DataNews({this.data, this.length, this.status});

  factory DataNews.fromJson(Map<String, dynamic> json) => _$DataNewsFromJson(json);
  Map<String, dynamic> toJson() => _$DataNewsToJson(this);
}


@JsonSerializable()
class News {
  String? judul;
  String? link;
  String? poster;

  News({this.judul, this.link, this.poster});

// retrofit
  factory News.fromJson(Map<String,dynamic> json)=>_$NewsFromJson(json);
  Map<String,dynamic> toJson()=> _$NewsToJson(this);

//old manual
  // factory News.fromJson(Map<String, dynamic> json) => News(
  //       judul: json['judul'] ?? "",
  //       link: json['link'] ?? "",
  //       poster: json['poster'] ?? "",
  //     );
}
