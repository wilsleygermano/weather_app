import 'package:dio/dio.dart';
import 'package:weather_app/core/adapters/remote_client_error.dart';
import 'package:weather_app/core/generics/api_response.dart';

abstract class RemoteClient {
  Future<ApiResponse<Map<String, dynamic>, RemoteClientError>> get(String url);
}

class DioRemoteClient implements RemoteClient {
  final _dio = Dio();

  @override
  Future<ApiResponse<Map<String, dynamic>, RemoteClientError>> get(
      String url) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(url);
      if (response.statusCode != 200) {
        return ApiResponse(
            statusCode: response.statusCode!,
            error: RemoteClientError.badRequest);
      }
      return ApiResponse(statusCode: 200, data: response.data);
    } on DioError catch (_) {
      return ApiResponse(statusCode: 500, error: RemoteClientError.badRequest);
    }
  }
}
