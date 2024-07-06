import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_test/features/home/presentation/cubits/current_user/current_user_cubit.dart';
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';

extension ContextExt on BuildContext {
  CurrentUserCubit get currentUserCubit => read<CurrentUserCubit>();

  UserEntity? get currentUser => currentUserCubit.userEntity;
}
