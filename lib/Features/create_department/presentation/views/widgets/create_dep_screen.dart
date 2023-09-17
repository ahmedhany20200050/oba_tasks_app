import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/manger/cubit/create_dep_cubit.dart';
import 'package:tasks_app_eraasoft/Features/create_department/presentation/manger/cubit/create_dep_state.dart';
import 'package:tasks_app_eraasoft/Features/update_department/presentation/views/widgets/update_dep_screen.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/helpers/custon_snakbar.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';

class CreateDepScreen extends StatefulWidget {
  const CreateDepScreen({super.key});
  static const id = 'CreateDepScreen';

  @override
  State<CreateDepScreen> createState() => _CreateDepScreenState();
}

class _CreateDepScreenState extends State<CreateDepScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController namecon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateDepCubit, CreateDepState>(
      listener: (context, state) {
        if (state is CreateDepSuccess) {
          Navigator.of(context).pushNamed(UpdateDepScreen.id);
          customSnakbar(
            context,
            const SnackBar(
              content: Text('Department created successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is CreateDepFailure) {
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
        return Scaffold(
          body: state is CreateDepLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 24 * SizeConfig.horizontalBlock,
                        vertical: 48 * SizeConfig.verticalBlock),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Text(
                            ' New Department!',
                            textAlign: TextAlign.center,
                            style: AppStyles.LoginTextStyle1,
                          ),
                          SizedBox(
                            height: 20 * SizeConfig.verticalBlock,
                          ),
                          SizedBox(
                            width: 274 * SizeConfig.horizontalBlock,
                            child: Text(
                              'Create a new department now and assign a manager to start the work!',
                              textAlign: TextAlign.center,
                              style: AppStyles.LogintextStyle2,
                            ),
                          ),
                          SizedBox(
                            height: 20 * SizeConfig.verticalBlock,
                          ),
                          TextFormField(
                            controller: namecon,
                            decoration: const InputDecoration(
                              hintText: 'Name',
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
                          SizedBox(
                            width: 312 * SizeConfig.horizontalBlock,
                            height: 48 * SizeConfig.verticalBlock,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    BlocProvider.of<CreateDepCubit>(context)
                                        .createDepartment(name: namecon.text);
                                  }
                                },
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFF5A55CA),
                                  ),
                                ),
                                child: Text(
                                  'CREATE',
                                  style: AppStyles.textStyle14,
                                )),
                          )
                          // TextButton(onPressed: () {  }, child: ,),
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
