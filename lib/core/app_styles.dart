import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

import 'app_colors.dart';
class AppStyles{
  static  TextStyle titleStyle =  TextStyle(
    color:const Color(0xFF091E4A),
    fontSize: 34*SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 0.03*SizeConfig.textRatio,
    letterSpacing: 0.25*SizeConfig.textRatio,
  );
  static TextStyle descriptionStyle= TextStyle(
    color:const Color(0xFF7B808A),
    fontSize: 16*SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1,
    letterSpacing: 1,
  );
  static TextStyle LogintextStyle3= TextStyle(
    color:const Color(0xFF5A55CA),
    fontSize: 16*SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 0.11,
    letterSpacing: 0.44,
  );

  static TextStyle buttonTextStyle=TextStyle(
    color: Colors.white,
    fontSize: 14*SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    height: 0.08,
    letterSpacing: 1,
  );

  static TextStyle homeTitleStyle= TextStyle(
    color: Color(0xFF091E4A),
    fontSize: 16*SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );

  static TextStyle secondaryTextStyle= TextStyle(
    color: Color(0xFF7B808A),
    fontSize: 12*SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,

  );
  static TextStyle homeProgressStyle =  TextStyle(
    color: Color(0xFF091E4A),
    fontSize: 8*SizeConfig.textRatio,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w900,
  );
  static TextStyle calendarDayNamesStyle=  TextStyle(
    color: Color(0xB2111111),
    fontSize: 12*SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
  );
  static TextStyle homeTaskTitleStyle= TextStyle(
    color: const Color(0xFF5A55CA),
    fontSize: 16*SizeConfig.textRatio,
    fontFamily: 'Roboto',
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
  static final TextStyle
  color0xFF7B808AFontSize8FontWeightW400Height16AfterTheDecimalPointLetterSpacing44AfterTheDecimalPoint =
  GoogleFonts.roboto(
    color: AppColors.color0xFF7B808A,
    fontSize: 8 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
  color0xFF091E4AFontSize16FontWeightW700Height07AfterTheDecimalPointLetterSpacing25AfterTheDecimalPoint =
  GoogleFonts.roboto(
    color: AppColors.color0xFF091E4A,
    fontSize: 16 * SizeConfig.textRatio,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle
  color0xFF7B808AFontSize12FontWeightW400Height17AfterTheDecimalPointLetterSpacing15AfterTheDecimalPoint =
  GoogleFonts.roboto(
    color: AppColors.color0xFF7B808A,
    fontSize: 12 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
  color0xFF5A55CAFontSize12FontWeightW700Height08AfterTheDecimalPoint25AfterTheDecimalPoint =
  GoogleFonts.roboto(
    color: AppColors.color0xFF5A55CA,
    fontSize: 12 * SizeConfig.textRatio,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle
  color0xFF091E4AFontSize12FontWeightW700Height08AfterTheDecimalPoint25AfterTheDecimalPoint =
  GoogleFonts.roboto(
    color: AppColors.color0xFF091E4A,
    fontSize: 12 * SizeConfig.textRatio,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle
  color0xFF091E4AFontSize12FontWeightW400Height17AfterTheDecimalPointLetterSpacing15AfterTheDecimalPoint =
  GoogleFonts.roboto(
    color: AppColors.color0xFF091E4A,
    fontSize: 12 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
  color0xFF091E4AFontSize16FontWeightW700Height05AfterTheDecimalPointLetterSpacing44AfterTheDecimalPoint =
  GoogleFonts.roboto(
    color: AppColors.color0xFF091E4A,
    fontSize: 16 * SizeConfig.textRatio,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle
  color0xFF5A55CAFontSize8FontWeightW400Height16AfterTheDecimalPointLetterSpacing44AfterTheDecicmalPoint =
  GoogleFonts.roboto(
    color: AppColors.color0xFF5A55CA,
    fontSize: 8 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
  color0xFF091E4AFontSize8FontWeightW400Height20AfterTheDecimalPointLetterSpacing44AfterTheDecimalPoint =
  GoogleFonts.roboto(
    color: AppColors.color0xFF091E4A,
    fontSize: 8 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
  fontFamilyInterColor0xFF091E4AFontSize14FontWeightW700Height0 =
  GoogleFonts.inter(
    color: AppColors.color0xFF091E4A,
    fontSize: 14 * SizeConfig.textRatio,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle
  fontFamilyInterColor0xFF7B808AFontSize12FontWeightW400Height0 =
  GoogleFonts.inter(
    color: AppColors.color0xFF7B808A,
    fontSize: 12 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
  fontFamilyInterColor0xFF091E4AFontSize15FontWeightW400Height10AfterTheDecimalPoint =
  GoogleFonts.inter(
    color: AppColors.color0xFF091E4A,
    fontSize: 15 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
  fontFamilyInterColor0xFF5A55CAFontSize15FontWeightW400Height10AfterTheDecimalPoint =
  GoogleFonts.inter(
    color: AppColors.color0xFF5A55CA,
    fontSize: 15 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
  fontFamilyInterColor0xFF7B808AFontSize14FontWeightW400Height11AfterTheDecimalPoint =
  GoogleFonts.inter(
    color: AppColors.color0xFF7B808A,
    fontSize: 14 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle
  fontFamilyInterColorWhiteFontSize15FontWeightW400Height10AfterTheDecimalPoint =
  GoogleFonts.inter(
    color: AppColors.colorWhite,
    fontSize: 15 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );
  static TextStyle LogintextStyle2 = TextStyle(
    color: const Color(0xFF7B808A),
    fontSize: 16 * SizeConfig.textRatio,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1,
    letterSpacing: 1,
  );
  static final TextStyle loginTextStyle1 = GoogleFonts.roboto(
    color: const Color(0xFF091E4A),
    fontSize: 34 * SizeConfig.textRatio,
    fontWeight: FontWeight.w400,
  );

}