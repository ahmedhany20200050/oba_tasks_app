import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_user/presentation/views/widgets/create_user_screen.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manger/cubit/update_dep_cubit.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/manger/cubit/update_dep_state.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/helpers/custon_snakbar.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class UpdateDepScreen extends StatefulWidget {
  const UpdateDepScreen({super.key});
  static const id = 'UpdateDepScreen';

  @override
  State<UpdateDepScreen> createState() => _UpdateDepScreenState();
}

class _UpdateDepScreenState extends State<UpdateDepScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController namecon = TextEditingController();
  TextEditingController managerIdcon = TextEditingController();
  int? selectedDepId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateDepCubit, UpdateDepState>(
      listener: (context, state) {
        if (state is UpdateDepSuccess) {
          Navigator.of(context).pushNamed(CreateUSerScreen.id);
          customSnakbar(
            context,
            const SnackBar(
              content: Text('Department updated successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is UpdateDepFailure) {
          customSnakbar(
            context,
            SnackBar(
              content: Text(state.errmsg),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        var updateDepCbt = BlocProvider.of<UpdateDepCubit>(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: state is UpdateDepLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 24 * SizeConfig.horizontalBlock,
                    vertical: 48 * SizeConfig.verticalBlock),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Update Department!',
                          textAlign: TextAlign.center,
                          style: AppStyles.LoginTextStyle1,
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        SizedBox(
                          width: 274 * SizeConfig.horizontalBlock,
                          child: Text(
                            'Update  department details and assign a new manager to continue work!',
                            textAlign: TextAlign.center,
                            style: AppStyles.LogintextStyle2,
                          ),
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        const Row(
                          children: [
                            Text(
                              'Choose Department ID',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10 * SizeConfig.verticalBlock,
                        ),
                        DropdownSearch<int>(
                          items: updateDepCbt.depsIdList,
                          onChanged: (value) {
                            selectedDepId = value;
                          },
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value == null) {
                              return 'Department ID must not be choosen';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        TextFormField(
                          controller: namecon,
                          decoration: const InputDecoration(
                            hintText: 'New Name',
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name must not be empty';
                            } else if (value.length < 3 ||
                                value.length > 20) {
                              return 'Name must be between 3-20 characters';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        TextFormField(
                          controller: managerIdcon,
                          decoration: const InputDecoration(
                            hintText: 'Assigned Manager',
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Manager ID must not be empty';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        SizedBox(
                          width: 312 * SizeConfig.horizontalBlock,
                          height: 48 * SizeConfig.verticalBlock,
                          child: ElevatedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  BlocProvider.of<UpdateDepCubit>(context)
                                      .updateDepartment(
                                    depId: selectedDepId.toString(),
                                    depName: namecon.text,
                                    managerId: managerIdcon.text,
                                  );
                                }
                              },
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(0xFF5A55CA),
                                ),
                              ),
                              child: Text(
                                'UPDATE',
                                style: AppStyles.textStyle14,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
        );
      },
    );
  }
}
