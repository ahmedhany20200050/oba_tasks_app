import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class ContactInfo extends StatelessWidget {
  final String contactText;
  final String contactIconAsset;
  const ContactInfo(
      {super.key, required this.contactText, required this.contactIconAsset});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          contactIconAsset,
          width: 12 * SizeConfig.horizontalBlock,
          height: 12 * SizeConfig.verticalBlock,
        ),
        SizedBox(
          width: 2 * SizeConfig.horizontalBlock,
        ),
        Text(
          contactText,
          style: AppStyles
              .color0xFF091E4AFontSize8FontWeightW400Height20AfterTheDecimalPointLetterSpacing44AfterTheDecimalPoint,
        )
      ],
    );
  }
}
