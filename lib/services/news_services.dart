part of 'services.dart';
class NewsServices{
  static Future<List<News>> getIntNews()async{
    final clientDio=Dio();
    Response response=await clientDio.get('$baseUrl/internasional');
    
    List<News> listNews=((response.data['data'] as Iterable).map((e)=>News.fromJson(e))).toList();
    return listNews;
  }
}