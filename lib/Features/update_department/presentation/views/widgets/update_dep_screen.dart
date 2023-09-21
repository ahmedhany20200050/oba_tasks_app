import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/data/models/admin_dep_model.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_cubit.dart';
import 'package:tasks_app_eraasoft/Features/admin_view/presentation/manger/cubit/admin_view_state.dart';
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
  String? name;
  int? selectedmanaId;

  @override
  Widget build(BuildContext context) {
    AdminDepModel depModel =
        ModalRoute.of(context)!.settings.arguments as AdminDepModel;
    return BlocBuilder<AdminViewCubit, AdminViewStates>(
      builder: (context, state) {
        return BlocConsumer<UpdateDepCubit, UpdateDepState>(
          listener: (context, state) {
            if (state is UpdateDepSuccess) {
              BlocProvider.of<AdminViewCubit>(context).adminAllDeparts();
              customSnakbar(
                context,
                const SnackBar(
                  content: Text('Department updated successfully'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
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
                              TextFormField(
                                initialValue: depModel.name,
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
                                onChanged: (value) {
                                  name = value;
                                },
                                // ignore: body_might_complete_normally_nullable
                                validator: (value) {
                                  if (value!.length < 3 || value.length > 20) {
                                    return 'Name must be between 3-20 characters';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20 * SizeConfig.verticalBlock,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'Choose Manager ID',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10 * SizeConfig.verticalBlock,
                              ),
                              DropdownSearch<int>(
                                selectedItem: depModel.manager!.id,
                                items: updateDepCbt.managerssIdList,
                                onChanged: (value) {
                                  selectedmanaId = value;
                                },
                                // ignore: body_might_complete_normally_nullable
                                validator: (value) {
                                  if (value == null) {
                                    return 'Department ID must be choosen';
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
                                          depId: depModel.id.toString(),
                                          depName: name ?? depModel.name!,
                                          managerId: selectedmanaId
                                                      .toString() ==
                                                  'null'
                                              ? depModel.manager!.id.toString()
                                              : selectedmanaId.toString(),
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
      },
    );
  }
}
