import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/core/constants/api_routes.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  @observable
  double temperature = 0.0;

  @action
  Future<void> returnCityValues(String city) async {
    try {
      CityEntity cityModel;
      final dio = Dio();
      var response = await dio.get(ApiRoutes.urlApi + "q=$city" + ApiRoutes.apiKey);
      final json = Map<String, dynamic>.from(response.data);
      cityModel = CityEntity.fromJson(json);
      temperature = cityModel.temperature!;
    } on DioError catch (e) {
      temperature = 0;
    }
  }
}
