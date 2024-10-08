import 'package:online_exam/domain/commen/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';

abstract class AuthRepository{
  Future<Result<User?>> login({required String  email, required String  password } );
}