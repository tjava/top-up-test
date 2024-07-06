import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/core/constants/string_constant.dart';
import 'package:top_up_test/core/errors/failures.dart';
import 'package:top_up_test/features/home/presentation/cubits/current_user/current_user_cubit.dart'
    show CurrentUserCubit;
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';
import 'package:top_up_test/features/user/domain/usecases/create_user_usecase.dart';
import 'package:top_up_test/locator/locate.dart';

part 'create_user_state.dart';

@injectable
class CreateUserCubit extends Cubit<CreateUserState> {
  final CreateUserUsecase createUserUsecase;
  CreateUserCubit(this.createUserUsecase) : super(CreateUserInitial());

  final currentUser = locate<CurrentUserCubit>();

  Future<void> createUser(UserEntity userEntity) async {
    emit(const Loading());
    if (currentUser.userEntity.activeBeneficiaries! >= 5) {
      emit(const Error('maximum beneficiaries limit exceeded.'));
      return;
    }

    final result = await createUserUsecase(userEntity);

    result.fold((Failure failure) => emit(Error(failure.message ?? kGenericError)), (_) {
      currentUser.updateUser(currentUser.userEntity
          .copyWith(activeBeneficiaries: currentUser.userEntity.activeBeneficiaries! + 1));
      emit(const Loaded());
    });
  }
}
