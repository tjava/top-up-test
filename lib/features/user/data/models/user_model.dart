import 'dart:convert';

import 'package:top_up_test/features/user/domain/entities/user_entity.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String listUserModelToJson(List<UserModel> data) {
  List<Map<String, dynamic>> newList = [];
  for (var element in data) {
    newList.add(element.toJson());
  }
  return json.encode(newList);
}

class UserModel extends UserEntity {
  const UserModel({
    super.uuid,
    required super.firstName,
    required super.lastName,
    required super.nickname,
    required super.phone,
    super.isVerified,
    super.accountBalance,
    super.activeBeneficiaries,
    super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uuid: json["uuid"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        nickname: json["nickname"],
        phone: json["phone"],
        isVerified: json["isVerified"],
        accountBalance: json["accountBalance"],
        activeBeneficiaries: json["activeBeneficiaries"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  factory UserModel.fromEntity(UserEntity user) => UserModel(
        uuid: user.uuid,
        firstName: user.firstName,
        lastName: user.lastName,
        nickname: user.nickname,
        phone: user.phone,
        isVerified: user.isVerified,
        accountBalance: user.accountBalance,
        activeBeneficiaries: user.activeBeneficiaries,
        createdAt: user.createdAt,
      );

  UserModel copyWith({
    String? uuid,
    String? firstName,
    String? lastName,
    String? nickname,
    String? phone,
    bool? isVerified,
    int? accountBalance,
    int? activeBeneficiaries,
    DateTime? createdAt,
  }) {
    return UserModel(
      uuid: uuid ?? this.uuid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nickname: nickname ?? this.nickname,
      phone: phone ?? this.phone,
      isVerified: isVerified ?? this.isVerified,
      accountBalance: accountBalance ?? this.accountBalance,
      activeBeneficiaries: activeBeneficiaries ?? this.activeBeneficiaries,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "firstName": firstName,
        "lastName": lastName,
        "nickname": nickname,
        "phone": phone,
        "isVerified": isVerified,
        "accountBalance": accountBalance,
        "activeBeneficiaries": activeBeneficiaries,
        "createdAt": createdAt?.toIso8601String(),
      };
}
