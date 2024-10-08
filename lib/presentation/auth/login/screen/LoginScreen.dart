import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/utils/dialog/DialogMethod.dart';
import 'package:online_exam/presentation/auth/login/view_model/login_cubit.dart';
import 'package:online_exam/presentation/auth/login/widget/email_field_widget.dart';
import 'package:online_exam/presentation/auth/login/widget/forget_password_widget.dart';
import 'package:online_exam/presentation/auth/login/widget/login_submit.dart';
import 'package:online_exam/presentation/auth/login/widget/password_field_widget.dart';
import 'package:online_exam/presentation/auth/login/widget/remember_me_widget.dart';
import 'package:online_exam/presentation/auth/widget/prom_pto_widet.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var loginViewModel = getIt.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) => _handleBlocListener(state),
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Login",
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              child: Center(
                child: Column(
                  children: [
                    EmailFieldWidget(
                      loginCubit: loginViewModel,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    PasswordFieldWidget(
                      loginCubit: loginViewModel,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const Row(
                      children: [
                        RememberMeWidget(),
                        Spacer(),
                        ForgetPasswordWidget(),
                      ],
                    ),
                    SizedBox(
                      height: 64.h,
                    ),
                    LoginSubmit(
                      loginCubit: loginViewModel,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    PromPtoWidget(
                      text: "Don't have an account",
                      textButton: " Sign up",
                      onPressed: () {

                      },
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }

  dynamic _handleBlocListener(LoginState loginStata) {
    {
      switch (loginStata) {
        case LoginLoadingStata():
          DialogMethod.showLoadingDialog(context: context);
        case LoginSuccessStata():
          Navigator.pop(context);

        case LoginErrorStata():
          Navigator.pop(context);
          DialogMethod.showErrorORWarningDialog(context: context,
              subtitle: "InternalServer Error",
              isError: false,
              fct: (){

              });

        default:
          return;
      }
    }
  }
}

