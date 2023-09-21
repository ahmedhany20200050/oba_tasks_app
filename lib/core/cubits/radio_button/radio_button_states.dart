abstract class RadioButtonStates {}

class RadioButtonInitial extends RadioButtonStates {}

class RadioButtonChanged extends RadioButtonStates {
  final int value;

  RadioButtonChanged({required this.value});
}
