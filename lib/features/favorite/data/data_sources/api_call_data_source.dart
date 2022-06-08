import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/adapters/remote_client.dart';
import 'package:weather_app/core/constants/api_routes.dart';
import 'package:weather_app/core/generics/resource.dart';
import 'package:weather_app/features/favorite/data/api_acess_error.dart';
abstract class AcessRemoteDataSource {
  Future<Resource<Map<String, dynamic>, ApiAcessError>> returnCityValues(
      String city);
}

class ApiAcessRemoteDataSource implements AcessRemoteDataSource {
  final _remoteClient = Modular.get<RemoteClient>();

  @override
  Future<Resource<Map<String, dynamic>, ApiAcessError>> returnCityValues(
      String city) async {
    final response = await _remoteClient.get(
      ApiRoutes.urlApi + "q=$city" + ApiRoutes.apiKey);
    if (response.statusCode != 200) {
      return Resource.failed(error: ApiAcessError.unknown);
    }
    if (response.statusCode == 500){
      return Resource.failed(error: ApiAcessError.dioError);
    }
    if (response.statusCode == 400){
      return Resource.failed(error: ApiAcessError.badRequest);
    }
    return Resource.success(data: response.data);
  }
}