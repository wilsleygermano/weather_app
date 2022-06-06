import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/core/constants/api_routes.dart';
import 'package:weather_app/features/favorite/data/data_sources/api_call_data_source.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';
part 'favorite_page_controller.g.dart';

class FavoritePageController = _FavoritePageControllerBase
    with _$FavoritePageController;

abstract class _FavoritePageControllerBase with Store {
  @observable
  String city = '';

  @action
  void storeCityTyped(String newValue) => city = newValue;

  @observable
  double temperature = 0;

  @action
  Future<void> returnCityValues(String city) async {
    CityEntity cityModel;
    final dio = Dio();
    // var response = await dio.get(ApiRoutes.urlApi + "q=$city" + ApiRoutes.apiKey);
    var response = await dio.get("http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=d59d0a951771e6dc45ff7cbc4d599f8c&units=metric");
    final json = jsonDecode(response.data.toString());
    cityModel = CityEntity.fromJson(json);
    temperature = cityModel.temperature!;
  }
}
