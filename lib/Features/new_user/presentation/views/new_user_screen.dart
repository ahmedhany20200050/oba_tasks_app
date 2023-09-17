// import 'package:flutter/material.dart';
// import 'package:tasks_app_eraasoft/core/app_styles.dart';
// import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
// import 'package:tasks_app_eraasoft/core/widgets/custom_button.dart';
// import 'package:tasks_app_eraasoft/core/widgets/custom_text_form_field.dart';

// class NewUserScreen extends StatefulWidget {
//   const NewUserScreen({super.key});

//   @override
//   State<NewUserScreen> createState() => _NewUserScreenState();
// }

// class _NewUserScreenState extends State<NewUserScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<UpdateDepartmentCubit, UpdateDepartmentStates>(
//         listener: (_, state) {
//           if (state is UpdateDepartmentSuccess) {
//             Navigator.of(context).pop();
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text(state.successMessage)));
//           } else if (state is UpdateDepartmentFailure) {
//             Navigator.of(context).pop();
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text(state.errorMessage)));
//           } else {
//             showDialog(
//                 context: context,
//                 builder: (_) => const Dialog(
//                       child: Center(child: Text("Loading...")),
//                     ));
//           }
//         },
//         child: Container(
//           padding: EdgeInsets.symmetric(
//               horizontal: 24 * SizeConfig.horizontalBlock,
//               vertical: 48 * SizeConfig.verticalBlock),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         " Update Department!",
//                         style: AppStyles.loginTextStyle1,
//                         textAlign: TextAlign.center,
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(
//                             top: 20 * SizeConfig.verticalBlock,
//                             left: 38 * SizeConfig.horizontalBlock,
//                             right: 38 * SizeConfig.horizontalBlock),
//                         child: Text(
//                             "Update  department details and assign a new manager to continue work!",
//                             textAlign: TextAlign.center,
//                             style: AppStyles
//                                 .color0xFF091E4AFontSize16FontWeightW400Height09AfterTheDecimalPointLetterSpacing15AfterTheDecimalPoint),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20 * SizeConfig.verticalBlock,
//                   ),
//                   CustomTextFormField(
//                     hintText: "Name",
//                     controller: _departmentNameController,
//                     validator: (name) {
//                       int length = name!.length;
//                       if (length < 3 || length > 20) {
//                         return "The name lenght must be between 3 and 20 characters";
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: 20 * SizeConfig.verticalBlock,
//                   ),
//                   CustomTextFormField(
//                     hintText: "Assigned Manager",
//                     controller: _managerIdController,
//                     validator: (managerId) {
//                       try {
//                         int.parse(managerId!);
//                         return null;
//                       } catch (_) {
//                         return "Please, write a number";
//                       }
//                     },
//                   ),
//                   SizedBox(
//                     height: 20 * SizeConfig.verticalBlock,
//                   ),
//                   CustomButton(
//                       textButton: "CREATE",
//                       onTap: () {
//                         if (_formKey.currentState!.validate()) {
//                           UpdateDepartmentCubit.get(context).updateDepartment(
//                               departmentName: _departmentNameController.text,
//                               managerId: _managerIdController.text);
//                         }
//                       })
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }