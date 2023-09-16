import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

import '../../../../core/app_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24*SizeConfig.horizontalBlock,vertical: 48*SizeConfig.verticalBlock),
        child: Column(
          children: [
            Text("Welcome Back!",style: AppStyles.textStyle,),
            Text("Login to access your assigned tasks and personal overview."),
          ],
        ),
      ),
    );
  }
}
