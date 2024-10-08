import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/ApiManger.dart';
import 'package:online_exam/data/api/model/UserDto.dart';
import 'package:online_exam/data/contracts/auth/AuthOnlineDataSource.dart';
import 'package:online_exam/domain/commen/ApiResult.dart';
import 'package:online_exam/domain/model/User.dart';

import '../../../domain/commen/ApiExtenceptions.dart';
@Injectable(as:AuthOnlineDataSource )
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  ApiManger apiManger;
  AuthOnlineDataSourceImpl(this.apiManger);
  @override
  Future<Result<User?>> login(
      {required String email, required String password}) async {
    return executeApi<User?>(
      () async {
        var authResponse =
            await apiManger.login(email: email, password: password);
        var userDto = UserDto(token: authResponse?.token);
        return userDto.toUser();
      },
    );
  }
}
