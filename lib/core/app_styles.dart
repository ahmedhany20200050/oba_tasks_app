// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class AppStyles {
  static TextStyle LoginTextStyle1 = TextStyle(
    color: const Color(0xFF091E4A),
    fontSize: 34 * SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static TextStyle LogintextStyle2 = TextStyle(
    color: const Color(0xFF7B808A),
    fontSize: 16 * SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );
  static TextStyle LogintextStyle3 = TextStyle(
    color: const Color(0xFF091E4A),
    fontSize: 16 * SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.44,
  );
  static TextStyle textStyle14 = TextStyle(
    color: Colors.white,
    fontSize: 14 * SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    letterSpacing: 0.1,
  );
  static TextStyle textStyle16dark025w700 = TextStyle(
    color: AppColors.darkprimaryswatch,
    fontSize: 16 * SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
  );
  static TextStyle textStyle12light015w400 = TextStyle(
    color: AppColors.lightprimaryswatch,
    fontSize: 12 * SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );
  static TextStyle textStyle8light044w400 = TextStyle(
    color: AppColors.lightprimaryswatch,
    fontSize: 8 * SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.44,
  );
}
