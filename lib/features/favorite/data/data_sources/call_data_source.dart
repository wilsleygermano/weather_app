import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/adapters/remote_client.dart';
import 'package:weather_app/core/constants/api_routes.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/features/favorite/data/api_call_error.dart';

abstract class CallRemoteDataSource {
  Future<Resource<Map<String, dynamic>, ApiCallError>> returnCityValues(
      String city, String temperatureUnit);
}

class ApiCallRemoteDataSource implements CallRemoteDataSource {
  final _remoteClient = Modular.get<RemoteClient>();

  @override
  Future<Resource<Map<String, dynamic>, ApiCallError>> returnCityValues(
      String city, String temperatureUnit) async {
    final response = await _remoteClient
        .get(ApiRoutes.urlApi + "q=$city" + ApiRoutes.apiKey + "&units=$temperatureUnit");
    if (response.statusCode != 200) {
      return Resource.failed(error: ApiCallError.unknown);
    }
    if (response.statusCode == 500) {
      return Resource.failed(error: ApiCallError.dioError);
    }
    if (response.statusCode == 400) {
      return Resource.failed(error: ApiCallError.badRequest);
    }
    return Resource.success(data: response.data);
  }
}
