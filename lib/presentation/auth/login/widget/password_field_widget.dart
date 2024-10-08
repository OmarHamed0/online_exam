import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/my_validators.dart';
import 'package:online_exam/presentation/auth/login/view_model/login_cubit.dart';
import 'package:online_exam/presentation/auth/widget/custom_text_form_field.dart';

class PasswordFieldWidget extends StatelessWidget {
  final LoginCubit  loginCubit;
  const PasswordFieldWidget({super.key, required this.loginCubit});

  @override
  Widget build(BuildContext context) {
    return    Form(
        key: loginCubit.passwordFormKey,
        child: CustomTextFromField(
          labelText: "Password",
          hintText: "Enter Your Password",
          controller: loginCubit.password,
          validator: (value)=>_validatorPassword(value),
          onChanged: (value) {
            if (loginCubit.passwordFormKey.currentState!.validate()) {}
          },
        ));
  }


  String? _validatorPassword(String? value) {
    String? myValidators = MyValidators.passwordValidator(value);
    bool isCheeked = myValidators != null ? false : true;
    loginCubit.updateButtonBackGroundColor(isCheeked);
    return myValidators;
  }
}
