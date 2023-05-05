import 'package:dio/dio.dart';

class HandleError {
  static String showMessageError(dynamic error) {
    String msg=error.toString();
    if (error is DioError) {
      var response = error.response;
      if (response == null) {
        msg = 'Tidak dapat mengakses server!';
      } else if (response.statusCode == 404) {
        msg = 'Data tidak ditemukan! ${response.statusCode}';
      } else {
        try {
          msg = error.response?.data["message"];
        } catch (e) {
          msg = "Kesalahan tidak teridentifikasi";
        }
      }
    } 
    return msg;
  }
}