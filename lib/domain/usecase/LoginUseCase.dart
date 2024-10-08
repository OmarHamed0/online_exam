import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/commen/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/domain/repository/AuthRepository.dart';
@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase(this.authRepository);


  Future<Result<User?>>invoke({
    required String email,
    required String password,
}){
    return authRepository.login(email: email, password: password);
  }
}