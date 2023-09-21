import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class TitleAndSubtitle extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  const TitleAndSubtitle({super.key, required this.titleText, required this.subtitleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titleText,
          style: AppStyles.loginTextStyle1,
          textAlign: TextAlign.center,
        ),
        Container(
          margin: EdgeInsets.only(
              top: 20 * SizeConfig.verticalBlock,
              left: 38 * SizeConfig.horizontalBlock,
              right: 38 * SizeConfig.horizontalBlock),
          child: Text(
              subtitleText,
              textAlign: TextAlign.center,
              style: AppStyles
                  .color0xFF091E4AFontSize16FontWeightW400Height09AfterTheDecimalPointLetterSpacing15AfterTheDecimalPoint),
        ),
      ],
    );
  }
}
