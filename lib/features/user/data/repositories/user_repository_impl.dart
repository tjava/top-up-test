import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/core/errors/exceptions.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/features/user/data/datasources/user_remote_datasource.dart';
import 'package:top_up_test/features/user/data/models/user_model.dart';
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';
import 'package:top_up_test/features/user/domain/repositories/user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource userRemoteDatasource;

  UserRepositoryImpl(this.userRemoteDatasource);

  @override
  Future<Either<Failure, void>> createUser(UserEntity userEntity) async {
    try {
      await userRemoteDatasource.createUser(UserModel.fromEntity(userEntity));

      return const Right<Failure, void>(null);
    } on CacheException catch (error) {
      return Left<Failure, void>(GenericFailure(
        message: error.message,
      ));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      final List<UserEntity> listUserEntity = await userRemoteDatasource.getUsers();

      return Right<Failure, List<UserEntity>>(listUserEntity);
    } on CacheException catch (error) {
      return Left<Failure, List<UserEntity>>(GenericFailure(
        message: error.message,
      ));
    }
  }
}
