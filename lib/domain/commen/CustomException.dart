
import 'package:dio/dio.dart';

class ServerError implements Exception {
  String? errorMassage;
  String? statusCode;
  ServerError({this.errorMassage, this.statusCode});
}

class DioHttpException implements Exception {
  String? errorMassage;
  DioHttpException({this.errorMassage});
}

class NoInternetError implements Exception {}
