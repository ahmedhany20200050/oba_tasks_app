import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
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

}