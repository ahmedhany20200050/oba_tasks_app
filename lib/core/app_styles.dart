import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class AppStyles {
  static final TextStyle loginTextStyle1 = GoogleFonts.roboto(
    color: const Color(0xFF091E4A),
    fontSize: 34 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
      color0xFF091E4AFontSize16FontWeightW400Height09AfterTheDecimalPointLetterSpacing15AfterTheDecimalPoint =
      GoogleFonts.roboto(
    color: AppColors.color0xFF7B808A,
    fontSize: 16 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
      color0xFF091E4AFontSize16FontWeightW400Height11AfterTheDecimalPartLetterSpacing44AfterTheDecimalPart =
      GoogleFonts.roboto(
    color: AppColors.color0xFF091E4A,
    fontSize: 16 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle colorWhiteFontSize14FontWeightW500 =
      GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 14 * SizeConfig.textRatio,
    fontWeight: FontWeight.w500,
  );
  static TextStyle LogintextStyle2 = TextStyle(
    color: const Color(0xFF7B808A),
    fontSize: 16 * SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1,
    letterSpacing: 1,
  );
  static TextStyle LogintextStyle3 = TextStyle(
    color: const Color(0xFF091E4A),
    fontSize: 16 * SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 0.11,
    letterSpacing: 0.44,
  );
}
