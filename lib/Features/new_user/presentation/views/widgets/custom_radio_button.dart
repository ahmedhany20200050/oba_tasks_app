import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class CustomRadioButton extends StatelessWidget {
  final String radioButtonText;
  const CustomRadioButton({super.key, required this.radioButtonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 5 * SizeConfig.horizontalBlock,
          vertical: 5 * SizeConfig.verticalBlock),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: SizeConfig.horizontalBlock,
              color: AppColors.color0xFF091E4A),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Radio(
            value: 1,
            groupValue: 1,
            onChanged: (value) {},
            activeColor: AppColors.color0xFF5A55CA,
          ),
          
          Text(radioButtonText,
              style: AppStyles
                  .color0xFF7B808AFontSize8FontWeightW400Height16AfterTheDecimalPointLetterSpacing44AfterTheDecimalPoint),
        ],
      ),
    );
  }
}
