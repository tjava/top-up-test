part of 'create_transaction_cubit.dart';

sealed class CreateTransactionState extends Equatable {
  const CreateTransactionState();

  @override
  List<Object> get props => [];
}

final class CreateTransactionInitial extends CreateTransactionState {}

class Loading extends CreateTransactionState {
  const Loading();
}

class Loaded extends CreateTransactionState {
  const Loaded();
}

class Error extends CreateTransactionState {
  final String message;
  const Error(this.message);

  @override
  List<Object> get props => [message];
}
