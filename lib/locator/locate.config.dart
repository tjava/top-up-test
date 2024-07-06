// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;
import 'package:top_up_test/core/services/third_party_services_module.dart'
    as _i20;
import 'package:top_up_test/features/home/data/datasources/home_remote_datasource.dart'
    as _i7;
import 'package:top_up_test/features/home/data/repositories/home_repository_impl.dart'
    as _i12;
import 'package:top_up_test/features/home/domain/repositories/home_repository.dart'
    as _i11;
import 'package:top_up_test/features/home/domain/usecases/clear_all_data_usecase.dart'
    as _i16;
import 'package:top_up_test/features/home/domain/usecases/create_transaction_usecase.dart'
    as _i15;
import 'package:top_up_test/features/home/domain/usecases/get_transactions_usecase.dart'
    as _i14;
import 'package:top_up_test/features/home/presentation/cubits/create_transaction/create_transaction_cubit.dart'
    as _i18;
import 'package:top_up_test/features/home/presentation/cubits/current_user/current_user_cubit.dart'
    as _i17;
import 'package:top_up_test/features/home/presentation/cubits/get_transactions/get_transactions_cubit.dart'
    as _i19;
import 'package:top_up_test/features/home/presentation/cubits/get_users/get_users_cubit.dart'
    as _i13;
import 'package:top_up_test/features/user/data/datasources/user_remote_datasource.dart'
    as _i4;
import 'package:top_up_test/features/user/data/repositories/user_repository_impl.dart'
    as _i6;
import 'package:top_up_test/features/user/domain/repositories/user_repository.dart'
    as _i5;
import 'package:top_up_test/features/user/domain/usecases/create_user_usecase.dart'
    as _i9;
import 'package:top_up_test/features/user/domain/usecases/get_users_usecase.dart'
    as _i8;
import 'package:top_up_test/features/user/presentation/cubits/create_user/create_user_cubit.dart'
    as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  await gh.lazySingletonAsync<_i3.SharedPreferences>(
    () => thirdPartyServicesModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i4.UserRemoteDatasource>(() => _i4.UserRemoteDatasourceImpl(
      sharedPreferences: gh<_i3.SharedPreferences>()));
  gh.lazySingleton<_i5.UserRepository>(
      () => _i6.UserRepositoryImpl(gh<_i4.UserRemoteDatasource>()));
  gh.lazySingleton<_i7.HomeRemoteDatasource>(() => _i7.HomeRemoteDatasourceImpl(
      sharedPreferences: gh<_i3.SharedPreferences>()));
  gh.lazySingleton<_i8.GetUsersUsecase>(
      () => _i8.GetUsersUsecase(gh<_i5.UserRepository>()));
  gh.lazySingleton<_i9.CreateUserUsecase>(
      () => _i9.CreateUserUsecase(gh<_i5.UserRepository>()));
  gh.factory<_i10.CreateUserCubit>(
      () => _i10.CreateUserCubit(gh<_i9.CreateUserUsecase>()));
  gh.lazySingleton<_i11.HomeRepository>(
      () => _i12.HomeRepositoryImpl(gh<_i7.HomeRemoteDatasource>()));
  gh.factory<_i13.GetUsersCubit>(
      () => _i13.GetUsersCubit(gh<_i8.GetUsersUsecase>()));
  gh.lazySingleton<_i14.GetTransactionsUsecase>(
      () => _i14.GetTransactionsUsecase(gh<_i11.HomeRepository>()));
  gh.lazySingleton<_i15.CreateTransactionUsecase>(
      () => _i15.CreateTransactionUsecase(gh<_i11.HomeRepository>()));
  gh.lazySingleton<_i16.ClearAllDataUsecase>(
      () => _i16.ClearAllDataUsecase(gh<_i11.HomeRepository>()));
  gh.lazySingleton<_i17.CurrentUserCubit>(
      () => _i17.CurrentUserCubit(gh<_i16.ClearAllDataUsecase>()));
  gh.factory<_i18.CreateTransactionCubit>(
      () => _i18.CreateTransactionCubit(gh<_i15.CreateTransactionUsecase>()));
  gh.factory<_i19.GetTransactionsCubit>(
      () => _i19.GetTransactionsCubit(gh<_i14.GetTransactionsUsecase>()));
  return getIt;
}

class _$ThirdPartyServicesModule extends _i20.ThirdPartyServicesModule {}
