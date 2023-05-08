import 'package:json_annotation/json_annotation.dart';

part 'detail_news.g.dart';

@JsonSerializable()
class DetailNews {
  final List<DataDetail>? data;
  final int? length;
  final int? status;

  DetailNews({this.data, this.length, this.status});

  factory DetailNews.fromJson(Map<String,dynamic> json)=> _$DetailNewsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailNewsToJson(this);

}


@JsonSerializable()
class DataDetail {
  final String? body;
  final String? judul;
  final String? poster;
  String? link;
  DataDetail({this.body, this.judul, this.poster, this.link});

  factory DataDetail.fromJson(Map<String, dynamic> json) =>
      _$DataDetailFromJson(json);
  Map<String, dynamic> toJson() => _$DataDetailToJson(this);
}


