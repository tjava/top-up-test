import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/core/errors/exceptions.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/features/home/data/datasources/home_remote_datasource.dart';
import 'package:top_up_test/features/home/data/models/transaction_model.dart';
import 'package:top_up_test/features/home/domain/entities/transaction_entity.dart';
import 'package:top_up_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;

  HomeRepositoryImpl(this.homeRemoteDatasource);

  @override
  Future<Either<Failure, TransactionEntity>> createTransaction(
      TransactionEntity transaction) async {
    try {
      final newTransaction =
          await homeRemoteDatasource.createTransaction(TransactionModel.fromEntity(transaction));

      return Right<Failure, TransactionEntity>(newTransaction);
    } on CacheException catch (error) {
      return Left<Failure, TransactionEntity>(GenericFailure(
        message: error.message,
      ));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>> getTransactions() async {
    try {
      final List<TransactionEntity> listTransactionEntity =
          await homeRemoteDatasource.getTransactions();

      return Right<Failure, List<TransactionEntity>>(listTransactionEntity);
    } on CacheException catch (error) {
      return Left<Failure, List<TransactionEntity>>(GenericFailure(
        message: error.message,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> clearAllData() async {
    try {
      await homeRemoteDatasource.clearAllData();

      return const Right<Failure, void>(null);
    } on CacheException catch (error) {
      return Left<Failure, void>(GenericFailure(
        message: error.message,
      ));
    }
  }
}
