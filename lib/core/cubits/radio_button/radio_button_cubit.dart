import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/core/cubits/radio_button/radio_button_states.dart';

class RadioButtonCubit extends Cubit<RadioButtonStates> {
  RadioButtonCubit() : super(RadioButtonInitial());
  static RadioButtonCubit get(context) => BlocProvider.of(context);
  void changeRadioButton({required int value}) {
    emit(RadioButtonChanged(value: value));
  }
}
