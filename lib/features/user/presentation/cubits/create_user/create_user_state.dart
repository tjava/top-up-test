part of 'create_user_cubit.dart';

sealed class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  List<Object> get props => [];
}

final class CreateUserInitial extends CreateUserState {}

class Loading extends CreateUserState {
  const Loading();
}

class Loaded extends CreateUserState {
  const Loaded();
}

class Error extends CreateUserState {
  final String message;
  const Error(this.message);

  @override
  List<Object> get props => [message];
}
