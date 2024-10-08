import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/ApiConstants.dart';
import 'package:online_exam/data/api/model/response/AuthResponse.dart';

@singleton
@injectable
class ApiManger {
  late Dio _dio;
  ApiManger() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }

  Future<AuthResponse?> login({
    required String email,
    required String password,
  }) async {
    var response = await _dio.post(ApiConstants.signInApi,
        data: {"email": email, "password": password});
    AuthResponse authResponse = AuthResponse.fromJson(response.data);
    return authResponse;
  }
}
