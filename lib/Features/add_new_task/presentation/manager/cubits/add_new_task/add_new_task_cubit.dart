import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/data/repo/add_new_task_repo.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/presentation/manager/cubits/add_new_task/add_new_task_states.dart';

class AddNewTaskCubit extends Cubit<AddNewTaskStates> {
  AddNewTaskCubit() : super(AddNewTaskInitialState());

  static AddNewTaskCubit get(context) => BlocProvider.of(context);

  void addNewTask(
      {required String name,
      required String description,
      required String startDate,
      required String endDate,
      required String employeeId}) async{
    try {
      emit(AddNewTaskLoadingState());
      await AddNewTaskRepo.addNewTask(
          name: name,
          description: description,
          startDate: startDate,
          endDate: endDate,
          employeeId: employeeId);
      emit(AddNewTaskSuccessState());
    } on Exception catch (e) {
      emit(AddNewTaskFailureState(errorMessage: e.toString()));
    } catch (_) {
      emit(AddNewTaskFailureState(errorMessage: "Something went wrong"));
    }
  }
}
