import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/cubits/radio_button/radio_button_cubit.dart';
import 'package:tasks_app_eraasoft/core/cubits/radio_button/radio_button_states.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class CustomRadioButton extends StatelessWidget {
  final String radioButtonText;
  final int value;
  final TextEditingController controller;
  const CustomRadioButton(
      {super.key, required this.radioButtonText, required this.value, required this.controller});

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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<RadioButtonCubit, RadioButtonStates>(
            builder: (_, state) => Radio.adaptive(
              visualDensity: VisualDensity.compact,
              value: value,
              groupValue: state is RadioButtonChanged ? state.value : 1,
              onChanged: (value) {
                controller.text = value.toString();
                RadioButtonCubit.get(context).changeRadioButton(value: value!);
              },
              activeColor: AppColors.color0xFF5A55CA,
            ),
          ),
          Text(radioButtonText,
              style: AppStyles
                  .color0xFF7B808AFontSize8FontWeightW400Height16AfterTheDecimalPointLetterSpacing44AfterTheDecimalPoint),
        ],
      ),
    );
  }
}
