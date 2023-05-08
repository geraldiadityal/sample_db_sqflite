part of 'services.dart';

class NewsServices {
  static Future<DataNews> getIntNews() async {
    final client = RestClient(Dio());
    return await client.getInternasionalNews();
  }
}
