import 'package:equatable/equatable.dart';

class TextFieldValidatorEntity extends Equatable {
  final bool Function(String) isValid;
  final String message;
  const TextFieldValidatorEntity({
    required this.isValid,
    required this.message,
  });

  @override
  List<Object> get props => [isValid, message];
}

TextFieldValidatorEntity maxValueValidator(int max) => TextFieldValidatorEntity(
      isValid: (String val) => val.length <= max,
      message: "This field lenght can't exceed $max",
    );
