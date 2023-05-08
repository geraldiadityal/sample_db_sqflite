import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:sample_db_sqflite/models/detail_news/detail_news.dart';
import 'package:sample_db_sqflite/models/models.dart';
import 'package:sample_db_sqflite/models/news/news.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://192.168.61.237:5000/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/internasional")
  Future<DataNews> getInternasionalNews();

  @GET("/detail?url={url}")
  Future<DetailNews> getDetailNews(@Path() String url);
}
