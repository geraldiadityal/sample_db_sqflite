// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataNews _$DataNewsFromJson(Map<String, dynamic> json) => DataNews(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
      length: json['length'] as int?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$DataNewsToJson(DataNews instance) => <String, dynamic>{
      'data': instance.data,
      'length': instance.length,
      'status': instance.status,
    };

News _$NewsFromJson(Map<String, dynamic> json) => News(
      judul: json['judul'] as String?,
      link: json['link'] as String?,
      poster: json['poster'] as String?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'judul': instance.judul,
      'link': instance.link,
      'poster': instance.poster,
    };
