// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailNews _$DetailNewsFromJson(Map<String, dynamic> json) => DetailNews(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      length: json['length'] as int?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$DetailNewsToJson(DetailNews instance) =>
    <String, dynamic>{
      'data': instance.data,
      'length': instance.length,
      'status': instance.status,
    };

DataDetail _$DataDetailFromJson(Map<String, dynamic> json) => DataDetail(
      body: json['body'] as String?,
      judul: json['judul'] as String?,
      poster: json['poster'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$DataDetailToJson(DataDetail instance) =>
    <String, dynamic>{
      'body': instance.body,
      'judul': instance.judul,
      'poster': instance.poster,
      'link': instance.link,
    };
