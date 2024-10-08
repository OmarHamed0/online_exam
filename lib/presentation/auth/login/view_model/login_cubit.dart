import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam/domain/commen/ApiResult.dart';
import 'package:online_exam/domain/commen/CustomException.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/domain/usecase/LoginUseCase.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState>emailFormKey=GlobalKey<FormState>();
  GlobalKey<FormState>passwordFormKey=GlobalKey<FormState>();

  void login() async {
    emit(LoginLoadingStata());
    var result =
        await loginUseCase.invoke(email: email.text, password: password.text);
    switch (result) {
      case Success<User?>():
        emit(LoginSuccessStata(user: result.data));
      case Fail<User?>():
        switch(result){
          case  DioHttpException():
            emit(LoginErrorStata(errorMassage:'Invalild Email  Or Password'));
          case NoInternetError():
            emit(LoginErrorStata(errorMassage:"NO Internt Execption "));
           default:
        emit(LoginErrorStata(errorMassage: result.exception.toString()));
        }

    }
  }

   bool isCheek=true;
  void updateButtonBackGroundColor(bool isCheeked) {
    isCheek = isCheeked;
    emit(UpdateButtonBackGroundColor());
  }
}
