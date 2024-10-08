import 'package:injectable/injectable.dart';
import 'package:online_exam/data/contracts/auth/AuthOnlineDataSource.dart';
import 'package:online_exam/domain/commen/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/domain/repository/AuthRepository.dart';
@Injectable(as:AuthRepository )
class AuthRepositoryImpl implements AuthRepository{
  AuthOnlineDataSource authOnlineDataSource;
  AuthRepositoryImpl(this.authOnlineDataSource);
  @override
  Future<Result<User?>> login({required String email, required String password}) {
   return authOnlineDataSource.login(email: email, password: password);
  }
}