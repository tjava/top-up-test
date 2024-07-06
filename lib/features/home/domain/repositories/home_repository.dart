import 'package:dartz/dartz.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/features/home/domain/entities/transaction_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, TransactionEntity>> createTransaction(TransactionEntity transactionEntity);
  Future<Either<Failure, List<TransactionEntity>>> getTransactions();
  Future<Either<Failure, void>> clearAllData();
}
