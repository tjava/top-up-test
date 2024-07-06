import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final dynamic statusCode;
  const Failure({
    this.message,
    this.statusCode,
  });
}

class GenericFailure extends Failure {
  const GenericFailure({super.message});

  @override
  List<Object?> get props => <Object?>[message];
}
