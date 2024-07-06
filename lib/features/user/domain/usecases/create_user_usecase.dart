import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/core/usecase/usecase.dart';
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';
import 'package:top_up_test/features/user/domain/repositories/user_repository.dart';

@LazySingleton()
class CreateUserUsecase extends UsecaseWithParams<void, UserEntity> {
  final UserRepository userRepository;
  CreateUserUsecase(
    this.userRepository,
  );

  @override
  Future<Either<Failure, void>> call(UserEntity params) async {
    return await userRepository.createUser(params);
  }
}
