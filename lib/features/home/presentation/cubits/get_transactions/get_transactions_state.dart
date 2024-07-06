part of 'get_transactions_cubit.dart';

sealed class GetTransactionsState extends Equatable {
  const GetTransactionsState();

  @override
  List<Object> get props => [];
}

final class GetTransactionsInitial extends GetTransactionsState {}

class Loading extends GetTransactionsState {
  const Loading();
}

class Loaded extends GetTransactionsState {
  final List<TransactionEntity> transactions;
  const Loaded(this.transactions);

  @override
  List<Object> get props => [transactions];
}

class Error extends GetTransactionsState {
  final String message;
  const Error(this.message);

  @override
  List<Object> get props => [message];
}
