// import 'package:dio/dio.dart';
// import 'package:weather_app/core/constants/api_routes.dart';
// import 'package:weather_app/features/favorite/domain/entities/city_entity.dart';

// abstract class ApiCallDataSource{
//   Future<void> returnCityValues(String city);
// }

// class FetchCityData implements ApiCallDataSource{
//   @override
//   Future<void> returnCityValues(String city) async{
//     try {
//       CityEntity cityModel;
//       final dio = Dio();
//       var response = await dio.get(ApiRoutes.urlApi + "q=$city" + ApiRoutes.apiKey);
//       final json = Map<String, dynamic>.from(response.data);
//       cityModel = CityEntity.fromJson(json);
//     } on DioError catch (e) {
//     }
//   }
// }