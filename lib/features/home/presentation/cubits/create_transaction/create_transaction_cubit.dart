import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/core/constants/string_constant.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/core/utils/helper_func.dart';
import 'package:top_up_test/features/home/domain/entities/transaction_entity.dart';
import 'package:top_up_test/features/home/domain/usecases/create_transaction_usecase.dart';
import 'package:top_up_test/features/home/presentation/cubits/current_user/current_user_cubit.dart'
    show CurrentUserCubit;
import 'package:top_up_test/locator/locate.dart';

part 'create_transaction_state.dart';

@injectable
class CreateTransactionCubit extends Cubit<CreateTransactionState> {
  final CreateTransactionUsecase createTransactionUsecase;
  CreateTransactionCubit(this.createTransactionUsecase) : super(CreateTransactionInitial());

  final currentUser = locate<CurrentUserCubit>();
  final int cherges = 1;

  Future<void> createTransaction(
      {required TransactionEntity transactionEntity, required int currentBalance}) async {
    emit(const Loading());

    if ((int.parse(extractAmount(transactionEntity.topUpOption)) + cherges) > currentBalance) {
      emit(const Error('insufficient funds'));
      return;
    }
    final result = await createTransactionUsecase(transactionEntity);

    result.fold(
      (Failure failure) => emit(Error(failure.message ?? kGenericError)),
      (TransactionEntity transaction) {
        emit(const Loaded());
        currentUser.updateUser(
          currentUser.userEntity.copyWith(
            accountBalance: currentUser.userEntity.accountBalance -
                (int.parse(extractAmount(transaction.topUpOption)) + cherges),
          ),
        );
      },
    );
  }
}
