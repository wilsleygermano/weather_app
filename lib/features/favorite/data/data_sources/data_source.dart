// abstract class LoginRemoteDataSource {
//   Future<Resource<Map<String, dynamic>, LoginError>> loginUser(
//       String email, String password);
// }

// class ApiLoginRemoteDataSource implements LoginRemoteDataSource {
//   final _remoteClient = Modular.get<RemoteClient>();

//   @override
//   Future<Resource<Map<String, dynamic>, LoginError>> loginUser(
//       String email, String password) async {
//     final response = await _remoteClient.post(
//       ApiRoutes.loginApiRoute,
//       {"email": email, "password": password},
//     );
//     if (response.statusCode != 201) {
//       return Resource.failed(error: LoginError.invalidCredentials);
//     }
//     return Resource.success(data: response.data);
//   }
// }
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:weather_app/features/favorite/domain/entities/api_entity.dart';

abstract class ApiCall {
  Future<ListApi> fetchApi(String city);
}

class FetchApi implements ApiCall{
  @override
  Future<ListApi> fetchApi(String city) async {
  final dio = Dio();
  var baseUrl = 'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=d59d0a951771e6dc45ff7cbc4d599f8c&units=metric';
  final response = await dio.get(baseUrl);
  final json = jsonDecode(response.data.toString());
  final listCities = ListApi.fromJson(json as Map<String, dynamic>);
  return listCities;
}
}
// Future<ListApi> fetchApi(String city) async {
//   final dio = Dio();
//   var baseUrl = 'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=d59d0a951771e6dc45ff7cbc4d599f8c&units=metric'
//   final response = await dio.get(baseUrl);
//   final json = jsonDecode(response.data.toString());
//   final listCities = ListApi.fromJson(json as Map<String, dynamic>);
//   return listCities;
// }

// Future<List<TvShows>> fetchSearch(String input) async {
//     var url = 'https://www.episodate.com/api/search?q=$input';
//     final response = await Dio().get(url);
//     if (response.statusCode != 200) {
//       return [];
//     }
//     final parsedResponse = SearchShowModel.fromJson(response.data);
//     return parsedResponse.tvShows!;
//   }