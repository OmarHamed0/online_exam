import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/styles.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: () {

      },
      child: Text(
        "ForgetPassword",
        textAlign: TextAlign.left,
        style: TextStyles.font13BlackWeight400
    ));
  }
  }

