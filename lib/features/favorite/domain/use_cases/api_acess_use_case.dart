import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/features/favorite/data/api_acess_error.dart';
import 'package:weather_app/features/favorite/data/repositories/api_call_repository.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';

abstract class ApiAcessUseCase {
  Future<Resource<CityEntity, ApiAcessError>> returnCityValues(
      String city);
}

class DefaultApiAcessUseCase implements ApiAcessUseCase {
  @override
  Future<Resource<CityEntity, ApiAcessError>> returnCityValues(
      String city) async {
    final _repository = Modular.get<ApiCallRepository>();

    final resource = await _repository.returnCityValues(city);
    if (resource.hasError) {
      return Resource.failed(error: ApiAcessError.apiError);
    }
    return Resource.success(data: resource.data);
  }
}