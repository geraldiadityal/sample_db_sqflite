part of 'services.dart';


class DetailNewsServices{
  static Future<DetailNews> getDetail(String link)async{
    final clientDio=Dio();
    Response response=await clientDio.get('$baseUrl/detail/?url=$link');
    
    DetailNews data=DetailNews.fromJson(response.data['data'][0]);
    return data;
  }
}