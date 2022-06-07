class ApiResponse<T, E>{
  T? data;
  E? error;
  int statusCode;
  ApiResponse ({this.data, this.error, required this.statusCode});
}

