import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/add_new_task/presentation/manager/cubits/calendar/calendar_states.dart';

class CalendarCubit extends Cubit<CalendarStates> {
  CalendarCubit() : super(CalendarInitialState());

  static CalendarCubit get(context) => BlocProvider.of(context);

  void updateCalendar() {
    emit(CalendarChangedState());
  }
}
