import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/new_department/presentation/manager/cubits/add_department/add_department_cubit.dart';
import 'package:tasks_app_eraasoft/Features/new_department/presentation/manager/cubits/add_department/add_department_states.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import 'package:tasks_app_eraasoft/core/widgets/custom_button.dart';
import 'package:tasks_app_eraasoft/core/widgets/custom_text_form_field.dart';

class NewDepartmentScreen extends StatefulWidget {
  const NewDepartmentScreen({super.key});
  static const id = 'NewDepartmentScreen';

  @override
  State<NewDepartmentScreen> createState() => _NewDepartmentScreenState();
}

class _NewDepartmentScreenState extends State<NewDepartmentScreen> {
  final TextEditingController _departmentNameController =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AddDepartmentCubit, AddDepartmentStates>(
        listener: (_, state) {
          if (state is AddDepartmentSuccess) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.successMessage)));
          } else if (state is AddDepartmentFailure) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else {
            showDialog(
                context: context,
                builder: (_) => const Dialog(
                      child: Center(child: Text("Loading...")),
                    ));
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 24 * SizeConfig.horizontalBlock,
              vertical: 48 * SizeConfig.verticalBlock),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "New Department",
                        style: AppStyles.loginTextStyle1,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20 * SizeConfig.verticalBlock,
                            left: 38 * SizeConfig.horizontalBlock,
                            right: 38 * SizeConfig.horizontalBlock),
                        child: Text(
                            "Create a new department now and assign a manager to start the work!",
                            textAlign: TextAlign.center,
                            style: AppStyles
                                .color0xFF091E4AFontSize16FontWeightW400Height09AfterTheDecimalPointLetterSpacing15AfterTheDecimalPoint),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    hintText: "Name",
                    controller: _departmentNameController,
                    validator: (name) {
                      int length = name!.length;
                      if (length < 3 || length > 25) {
                        return "The name lenght must be between 3 and 25 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomButton(
                      textButton: "CREATE",
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          AddDepartmentCubit.get(context).addDepartment(
                              departmentName: _departmentNameController.text);
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
