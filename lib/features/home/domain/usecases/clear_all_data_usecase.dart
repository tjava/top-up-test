import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/core/usecase/usecase.dart';
import 'package:top_up_test/features/home/domain/repositories/home_repository.dart';

@LazySingleton()
class ClearAllDataUsecase extends UsecaseWithoutParams<void> {
  final HomeRepository homeRepository;
  ClearAllDataUsecase(
    this.homeRepository,
  );

  @override
  Future<Either<Failure, void>> call() async {
    return await homeRepository.clearAllData();
  }
}
