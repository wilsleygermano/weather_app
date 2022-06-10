import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/features/favorite/data/api_call_error.dart';
import 'package:weather_app/features/favorite/data/data_sources/call_data_source.dart';
import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';

abstract class ApiCallRepository {
  Future<Resource<CityEntity, ApiCallError>> returnCityValues(String city, String temperatureUnit);
}

class DefaultApiCall implements ApiCallRepository {
  final _dataSource = Modular.get<CallRemoteDataSource>();

  @override
  Future<Resource<CityEntity, ApiCallError>> returnCityValues(
      String city, String temperatureUnit) async {
    final resource = await _dataSource.returnCityValues(city, temperatureUnit);
    if (resource.hasError) {
      return Resource.failed(error: resource.error);
    }

    final cityMap = resource.data;
    final cityEntity = CityEntity.fromApi(cityMap!);
    return Resource.success(data: cityEntity);
  }
}
