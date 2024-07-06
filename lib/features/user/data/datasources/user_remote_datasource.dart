import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_up_test/features/user/data/models/user_model.dart';
import 'package:top_up_test/features/user/user_constant.dart';

abstract class UserRemoteDatasource {
  Future<void> createUser(UserModel userModel);
  Future<List<UserModel>> getUsers();
}

@LazySingleton(as: UserRemoteDatasource)
class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final SharedPreferences sharedPreferences;
  UserRemoteDatasourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<void> createUser(UserModel userModel) async {
    List<UserModel> listUserModel = [];
    final String? data = sharedPreferences.getString(kUserKey);

    if (data != null) {
      listUserModel.addAll(userModelFromJson(data));
    }

    listUserModel.add(userModel);

    await sharedPreferences.setString(
      kUserKey,
      listUserModelToJson(listUserModel),
    );
  }

  @override
  Future<List<UserModel>> getUsers() async {
    List<UserModel> listUserModel = [];
    final String? data = sharedPreferences.getString(kUserKey);

    if (data != null) {
      listUserModel.addAll(userModelFromJson(data));
    }
    return listUserModel;
  }
}
