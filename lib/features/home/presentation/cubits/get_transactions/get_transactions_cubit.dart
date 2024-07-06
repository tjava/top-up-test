import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/core/constants/string_constant.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/features/home/domain/entities/transaction_entity.dart';
import 'package:top_up_test/features/home/domain/usecases/get_transactions_usecase.dart';

part 'get_transactions_state.dart';

@injectable
class GetTransactionsCubit extends Cubit<GetTransactionsState> {
  final GetTransactionsUsecase getTransactionsUsecase;
  GetTransactionsCubit(this.getTransactionsUsecase) : super(GetTransactionsInitial());

  Future<void> getTransactions() async {
    emit(const Loading());
    final result = await getTransactionsUsecase();

    result.fold(
      (Failure failure) => emit(Error(failure.message ?? kGenericError)),
      (List<TransactionEntity> listTransaction) => emit(Loaded(listTransaction.reversed.toList())),
    );
  }
}
