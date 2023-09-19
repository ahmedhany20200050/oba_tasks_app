abstract class AddNewTaskStates {}

class AddNewTaskInitialState extends AddNewTaskStates {}

class AddNewTaskLoadingState extends AddNewTaskStates {}

class AddNewTaskSuccessState extends AddNewTaskStates {}

class AddNewTaskFailureState extends AddNewTaskStates {
  final String errorMessage;

  AddNewTaskFailureState({required this.errorMessage});
}
