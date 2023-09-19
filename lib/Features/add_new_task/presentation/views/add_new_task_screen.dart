import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/presentation/manager/cubits/calendar/calendar_cubit.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/presentation/manager/cubits/calendar/calendar_states.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/presentation/views/widgets/calendar_chevron_icon.dart';
import 'package:tasks_app_eraasoft/Features/new_user/presentation/manager/cubits/new_user/new_user_cubit.dart';
import 'package:tasks_app_eraasoft/Features/new_user/presentation/manager/cubits/new_user/new_user_states.dart';
import 'package:tasks_app_eraasoft/core/app_colors.dart';
import 'package:tasks_app_eraasoft/core/app_styles.dart';
import 'package:tasks_app_eraasoft/core/utils/app_assets.dart';
import 'package:tasks_app_eraasoft/core/utils/size_config.dart';
import 'package:tasks_app_eraasoft/core/utils/snack_bar_viewer.dart';
import 'package:tasks_app_eraasoft/core/widgets/custom_button.dart';
import 'package:tasks_app_eraasoft/core/widgets/custom_text_form_field.dart';
import 'package:tasks_app_eraasoft/core/widgets/title_and_subtitle.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});
  static const id = 'AddNewTaskScreen';

  @override
  State<AddNewTaskScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<AddNewTaskScreen> with SnackBarViewer {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordContoller = TextEditingController();
  final TextEditingController _radioButtonController = TextEditingController();
  DateTime _startDate = DateTime.now();

  DateTime _endDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  // final TextEditingController _departmentNameController =
  //     TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordContoller.dispose();
    _radioButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NewUserCubit, NewUserStates>(
        listener: (_, state) {
          if (state is NewUserSuccess) {
            Navigator.of(context).pop();
            showSnackBar(
                context: context,
                message: "Added User Sucessfully",
                backgroundColor: Colors.green);
          } else if (state is NewUserFailure) {
            Navigator.of(context).pop();
            showSnackBar(
                context: context,
                message: state.errorMessage,
                backgroundColor: Colors.red);
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
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TitleAndSubtitle(
                      titleText: "Add New Task!",
                      subtitleText:
                          "Create a new task now and assign it to a user to start the work!"),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16 * SizeConfig.horizontalBlock,
                        vertical: 16 * SizeConfig.verticalBlock),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: SizeConfig.horizontalBlock,
                            color: AppColors.color0xFF091E4A),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: BlocBuilder<CalendarCubit, CalendarStates>(
                      builder: (_, state) => TableCalendar(
                        focusedDay: _focusedDay,
                        firstDay: DateTime.utc(DateTime.now().year - 10),
                        lastDay: DateTime.utc(DateTime.now().year + 10),
                        rangeStartDay: _startDate,
                        rangeEndDay: _endDate,
                        onRangeSelected: (start, end, focusedDay) {
                          _startDate = start!;
                          _endDate = end!;
                          _focusedDay = focusedDay;
                          CalendarCubit.get(context).updateCalendar();
                        },
                       
                        rangeSelectionMode: RangeSelectionMode.toggledOn,
                        headerStyle: HeaderStyle(
                            headerMargin: EdgeInsets.only(
                                bottom: 20 * SizeConfig.verticalBlock),
                            headerPadding: EdgeInsets.zero,
                            formatButtonPadding: EdgeInsets.zero,
                            leftChevronMargin: EdgeInsets.zero,
                            rightChevronMargin: EdgeInsets.zero,
                            leftChevronPadding: EdgeInsets.zero,
                            rightChevronPadding: EdgeInsets.zero,
                            leftChevronIcon: const CalendarChevronIcon(
                              backgroundColor: AppColors.color0xFF7B808A,
                              iconAsset: AppAssets.rightArrowIcon,
                            ),
                            rightChevronIcon: const CalendarChevronIcon(
                              iconAsset: AppAssets.leftArrowIcon,
                              backgroundColor: AppColors.color0xFF5A55CA,
                            ),
                            titleCentered: true,
                            formatButtonVisible: false,
                            titleTextStyle: AppStyles
                                .fontFamilyInterColor0xFF091E4AFontSize14FontWeightW700Height0),
                        daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: AppStyles
                                .fontFamilyInterColor0xFF7B808AFontSize12FontWeightW400Height0,
                            weekendStyle: AppStyles
                                .fontFamilyInterColor0xFF7B808AFontSize12FontWeightW400Height0),
                        calendarStyle: CalendarStyle(
                            rangeStartDecoration: const ShapeDecoration(
                              color: AppColors.color0xFF5A55CA,
                              shape: CircleBorder(),
                            ),
                            rangeEndDecoration: const ShapeDecoration(
                              color: AppColors.color0xFF5A55CA,
                              shape: CircleBorder(),
                            ),
                            
                            rangeHighlightColor:
                                AppColors.color0xFF5A55CA.withOpacity(0.3),
                            todayTextStyle: AppStyles
                                .fontFamilyInterColorWhiteFontSize15FontWeightW400Height10AfterTheDecimalPoint,
                            rangeStartTextStyle: AppStyles
                                .fontFamilyInterColorWhiteFontSize15FontWeightW400Height10AfterTheDecimalPoint,
                            rangeEndTextStyle: AppStyles
                                .fontFamilyInterColorWhiteFontSize15FontWeightW400Height10AfterTheDecimalPoint,
                            withinRangeTextStyle: AppStyles
                                .fontFamilyInterColor0xFF5A55CAFontSize15FontWeightW400Height10AfterTheDecimalPoint,
                            defaultTextStyle: AppStyles
                                .fontFamilyInterColor0xFF091E4AFontSize15FontWeightW400Height10AfterTheDecimalPoint,
                            weekendTextStyle: AppStyles
                                .fontFamilyInterColor0xFF091E4AFontSize15FontWeightW400Height10AfterTheDecimalPoint,
                            outsideTextStyle: AppStyles
                                .fontFamilyInterColor0xFF7B808AFontSize14FontWeightW400Height11AfterTheDecimalPoint),
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        calendarFormat: CalendarFormat.month,
                        
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    hintText: "Name",
                    controller: _nameController,
                    validator: (name) {
                      int length = name!.length;
                      if (length < 3 || length > 20) {
                        return "The name length must be between 3 and 20 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    hintText: "Email",
                    controller: _emailController,
                    validator: (email) {
                      if (!email!.contains("@")) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    hintText: "Phone",
                    controller: _phoneController,
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    hintText: "Password",
                    controller: _passwordContoller,
                    validator: (password) {
                      if (password!.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  // CustomTextFormField(
                  //   hintText: "Department Name",
                  //   controller: _departmentNameController,
                  // ),
                  // SizedBox(
                  //   height: 20 * SizeConfig.verticalBlock,
                  // ),
                  CustomButton(
                      textButton: "CREATE",
                      onTap: () {
                        // if (_formKey.currentState!.validate()) {
                        //   NewUserCubit.get(context).addUser(
                        //       name: _nameController.text,
                        //       email: _emailController.text,
                        //       phone: _phoneController.text,
                        //       password: _passwordContoller.text,
                        //       userType: _radioButtonController.text);
                        // }
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