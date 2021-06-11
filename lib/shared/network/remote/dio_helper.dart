import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{

  static Dio dio;
static init()
{
  dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    )
  );
}
//https://newsapi.org/v2/top-headlines
// v2/everything?
// q=tesla&from=2021-05-04&sortBy=publishedAt&apiKey=accd0f0cace247e0864b76d142b4bfbb

static Future<Response> getData({
  @required String url,
  @required  Map <String, dynamic> query,
})async
{
  return await dio.get(
    url,
    queryParameters: query,
  );
}
}