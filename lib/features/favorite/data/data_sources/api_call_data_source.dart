import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/api_routes.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';

abstract class ApiCallDataSource {
  Future<CityEntity> fetchApi(String city);
}

class FetchApi implements ApiCallDataSource{
  @override
  Future<CityEntity> fetchApi(String city) async {
  final dio = Dio();
  var baseUrl = ApiRoutes.urlApi+"q=$city"+ApiRoutes.apiKey;
  final response = await dio.get(baseUrl);
  final json = jsonDecode(response.data.toString());
  final listCities = CityEntity.fromJson(json as Map<String, dynamic>);
  return listCities;
}
}
