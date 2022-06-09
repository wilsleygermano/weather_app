import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/features/favorite/data/api_call_error.dart';
import 'package:weather_app/features/favorite/data/repositories/api_call_repository.dart';
import 'package:weather_app/features/favorite/domain/use_cases/api_call_use_case.dart';
part 'favorite_page_controller.g.dart';

class FavoritePageController = _FavoritePageControllerBase
    with _$FavoritePageController;

abstract class _FavoritePageControllerBase with Store {
  final _useCase = Modular.get<ApiCallUseCase>();
  final _repository = Modular.get<ApiCallRepository>();

  @observable
  String city = '';

  @action
  void storeCityTyped(String newValue) => city = newValue;

  @observable
  num temperature = 0;

  @observable
  num feelsLike = 0;

  @observable
  num tempMin = 0;

  @observable
  num tempMax = 0;

  @observable
  num humidity = 0;

  @observable
  num windSpeed = 0;

  @observable
  String dateTime = '';

  @observable
  String cityName = 'Pesquise um local';

  @observable
  String countryName = '...';

  @observable
  num temperatureDay2 = 0;

  @observable
  String dateTimeDay2 = '';

  @observable
  num temperatureDay3 = 0;

  @observable
  String dateTimeDay3 = '';

  @observable
  num temperatureDay4 = 0;

  @observable
  String dateTimeDay4 = '';

  @observable
  num temperatureDay5 = 0;

  @observable
  String dateTimeDay5 = '';

  @action
  Future<Resource<void, ApiCallError>> returnCityValues(String city) async {
    final resource = await _useCase.returnCityValues(city);
    final cityModel = await _repository.returnCityValues(city);
    if (resource.hasError) {
      return Resource.failed(error: ApiCallError.apiError);
    }
    temperature = cityModel.data!.temperature!;
    feelsLike = cityModel.data!.feelsLike!;
    tempMin = cityModel.data!.tempMin!;
    tempMax = cityModel.data!.tempMax!;
    humidity = cityModel.data!.humidity!;
    windSpeed = cityModel.data!.windSpeed!;
    dateTime = cityModel.data!.dateTime!;
    cityName = cityModel.data!.cityName!;
    countryName = cityModel.data!.countryName!;

    temperatureDay2 = cityModel.data!.temperatureDay2!;
    dateTimeDay2 = cityModel.data!.dateTimeDay2!;

    temperatureDay3 = cityModel.data!.temperatureDay3!;
    dateTimeDay3 = cityModel.data!.dateTimeDay3!;

    temperatureDay4 = cityModel.data!.temperatureDay4!;
    dateTimeDay4 = cityModel.data!.dateTimeDay4!;
    
    temperatureDay5 = cityModel.data!.temperatureDay5!;
    dateTimeDay5 = cityModel.data!.dateTimeDay5!;
    return Resource.success();
  }
}
