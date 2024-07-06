import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uuid;
  final String firstName;
  final String lastName;
  final String nickname;
  final String phone;
  final bool? isVerified;
  final int accountBalance;
  final int? activeBeneficiaries;
  final DateTime? createdAt;

  const UserEntity({
    this.uuid,
    required this.firstName,
    required this.lastName,
    required this.nickname,
    required this.phone,
    this.isVerified,
    this.accountBalance = 0,
    this.activeBeneficiaries,
    this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      uuid,
      firstName,
      lastName,
      nickname,
      phone,
      isVerified,
      accountBalance,
      activeBeneficiaries,
      createdAt,
    ];
  }

  UserEntity copyWith({
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
    return UserEntity(
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
}
