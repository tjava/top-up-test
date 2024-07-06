import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/core/usecase/usecase.dart';
import 'package:top_up_test/features/home/domain/entities/transaction_entity.dart';
import 'package:top_up_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton()
class GetTransactionsUsecase extends UsecaseWithoutParams<List<TransactionEntity>> {
  final HomeRepository homeRepository;
  GetTransactionsUsecase(
    this.homeRepository,
  );

  @override
  Future<Either<Failure, List<TransactionEntity>>> call() async {
    return homeRepository.getTransactions();
  }
}
