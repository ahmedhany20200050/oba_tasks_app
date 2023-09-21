import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/core/cubits/drop_down/drop_down_states.dart';

class DropDownCubit extends Cubit<DropDownStates> {
  DropDownCubit() : super(DropDownInitialState());
  static DropDownCubit get(context) => BlocProvider.of(context);
  void updateDropDown() {
    emit(DropDownChangedState());
  }
}
