import 'package:equatable/equatable.dart';

import 'package:top_up_test/features/user/domain/entities/user_entity.dart';

class TransactionEntity extends Equatable {
  final String? uuid;
  final UserEntity user;
  final String topUpOption;
  final DateTime? createdAt;

  const TransactionEntity({
    this.uuid,
    required this.user,
    required this.topUpOption,
    this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      uuid,
      user,
      topUpOption,
      createdAt,
    ];
  }
}
