part of 'get_users_cubit.dart';

sealed class GetUsersState extends Equatable {
  const GetUsersState();

  @override
  List<Object> get props => [];
}

final class GetUsersInitial extends GetUsersState {}

class Loading extends GetUsersState {
  const Loading();
}

class Loaded extends GetUsersState {
  final List<UserEntity> users;
  const Loaded(this.users);

  @override
  List<Object> get props => [users];
}

class Error extends GetUsersState {
  final String message;
  const Error(this.message);

  @override
  List<Object> get props => [message];
}
