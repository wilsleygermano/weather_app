import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/core/constants/api_routes.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/features/favorite/data/api_acess_error.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';
import 'package:weather_app/features/favorite/domain/use_cases/api_acess_use_case.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  // final _apiAcess = Modular.get<ApiAcesssUseCase>();
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
// @action
//   Future<Resource<void, ApiAcessError>> returnCityValues(String city) async {
//     final resource = await _apiAcess.returnCityValues(city);
//     if (resource.hasError) {
//       return Resource.failed(error: ApiAcessError.apiError);
//     }
//     user = resource;
//     return Resource.success();
//   }

