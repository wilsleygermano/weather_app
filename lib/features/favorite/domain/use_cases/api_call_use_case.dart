import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/features/favorite/data/api_call_error.dart';
import 'package:weather_app/features/favorite/data/repositories/api_call_repository.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';

abstract class ApiCallUseCase {
  Future<Resource<CityEntity, ApiCallError>> returnCityValues(String city, String temperatureUnit);
}

class DefaultApiCallUseCase implements ApiCallUseCase {
  @override
  Future<Resource<CityEntity, ApiCallError>> returnCityValues(
      String city, String temperatureUnit) async {
    final _repository = Modular.get<ApiCallRepository>();

    final resource = await _repository.returnCityValues(city, temperatureUnit);
    if (resource.hasError) {
      return Resource.failed(error: ApiCallError.apiError);
    }
    return Resource.success(data: resource.data);
  }
}
