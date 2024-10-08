import 'dart:async';

import 'package:dio/dio.dart';
import 'package:online_exam/domain/commen/ApiResult.dart';
import 'package:online_exam/domain/commen/CustomException.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(data: result);
  } on TimeoutException catch (e) {
    return Fail(exception: NoInternetError());
  } on DioException catch (e) {
    return Fail(exception: DioHttpException(
      errorMassage: e.response?.data['massage'] ?? "Invaild Email Or Password"

    ));
  } on Exception catch (e) {
    return Fail(exception: e);
  }
}


