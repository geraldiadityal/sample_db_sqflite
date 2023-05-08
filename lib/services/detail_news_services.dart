part of 'services.dart';

class DetailNewsServices {
  static Future<DetailNews> getDetail(String link) async {
    final client = RestClient(Dio());
    return await client.getDetailNews(link);
  }
}
