part of 'current_user_cubit.dart';

sealed class CurrentUserState extends Equatable {
  const CurrentUserState();

  @override
  List<Object> get props => [];
}

final class CurrentUserInitial extends CurrentUserState {}

class Loading extends CurrentUserState {
  const Loading();
}

class Loaded extends CurrentUserState {
  final UserEntity userEntity;

  const Loaded(this.userEntity);

  @override
  List<Object> get props => [userEntity];
}

class Error extends CurrentUserState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
