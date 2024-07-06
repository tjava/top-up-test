import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/core/usecase/usecase.dart';
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';
import 'package:top_up_test/features/user/domain/repositories/user_repository.dart';

@LazySingleton()
class GetUsersUsecase extends UsecaseWithoutParams<List<UserEntity>> {
  final UserRepository userRepository;
  GetUsersUsecase(
    this.userRepository,
  );

  @override
  Future<Either<Failure, List<UserEntity>>> call() async {
    return userRepository.getUsers();
  }
}
