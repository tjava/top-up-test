import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/core/constants/string_constant.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';
import 'package:top_up_test/features/user/domain/usecases/get_users_usecase.dart';

part 'get_users_state.dart';

@injectable
class GetUsersCubit extends Cubit<GetUsersState> {
  final GetUsersUsecase getUsersUsecase;
  GetUsersCubit(this.getUsersUsecase) : super(GetUsersInitial());

  Future<void> getUsers() async {
    emit(const Loading());
    final result = await getUsersUsecase();

    result.fold(
      (Failure failure) => emit(Error(failure.message ?? kGenericError)),
      (List<UserEntity> users) => emit(Loaded(users)),
    );
  }
}
