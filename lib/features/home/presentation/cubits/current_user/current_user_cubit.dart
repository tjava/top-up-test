import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:top_up_test/features/home/domain/usecases/clear_all_data_usecase.dart';
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';

part 'current_user_state.dart';

@LazySingleton()
class CurrentUserCubit extends Cubit<CurrentUserState> {
  final ClearAllDataUsecase clearAllDataUsecase;
  CurrentUserCubit(this.clearAllDataUsecase) : super(CurrentUserInitial()) {
    clearAllData();
    updateUser(_userEntity);
  }

  UserEntity _userEntity = UserEntity(
    uuid: "uuid_0",
    firstName: "Tom",
    lastName: "Cruise",
    nickname: "TomTom",
    phone: "+971-50-1234567",
    isVerified: true,
    accountBalance: 101,
    activeBeneficiaries: 0,
    createdAt: DateTime.parse("2025-03-01T00:00:00.000Z"),
  );
  UserEntity get userEntity => _userEntity;

  Future<void> updateUser(UserEntity userEntity) async {
    emit(const Loading());
    _userEntity = userEntity;
    emit(Loaded(userEntity));
  }

  Future<void> clearAllData() async {
    final result = await clearAllDataUsecase();

    result.fold(
      (_) => {},
      (_) => {},
    );
  }
}
