import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:weather_app/features/favorite/domain/entities/api_entity.dart';

abstract class ApiCallDataSource {
  Future<ListApi> fetchApi(String city);
}

class FetchApi implements ApiCallDataSource{
  @override
  Future<ListApi> fetchApi(String city) async {
  final dio = Dio();
  var baseUrl = 'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=d59d0a951771e6dc45ff7cbc4d599f8c&units=metric';
  final response = await dio.get(baseUrl);
  final json = jsonDecode(response.data.toString());
  final listCities = ListApi.fromJson(json as Map<String, dynamic>);
  return listCities;
}
}
