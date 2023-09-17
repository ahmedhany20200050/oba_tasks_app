import 'package:flutter/material.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 16 * SizeConfig.horizontalBlock,
          vertical: 4 * SizeConfig.verticalBlock),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: SizeConfig.horizontalBlock,
              color: AppColors.color0xFF091E4A),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: TextFormField(
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppStyles
                .color0xFF091E4AFontSize16FontWeightW400Height11AfterTheDecimalPartLetterSpacing44AfterTheDecimalPart),
      ),
    );
  }
}
