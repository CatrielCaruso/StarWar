import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  Dio get dio => _dio;
}
