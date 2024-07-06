import 'package:dartz/dartz.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> createUser(UserEntity userEntity);
  Future<Either<Failure, List<UserEntity>>> getUsers();
}
