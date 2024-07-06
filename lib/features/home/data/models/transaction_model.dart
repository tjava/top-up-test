import 'dart:convert';

import 'package:top_up_test/features/user/data/models/user_model.dart';
import 'package:top_up_test/features/home/domain/entities/transaction_entity.dart';

List<TransactionModel> transactionModelFromJson(String str) =>
    List<TransactionModel>.from(json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String listTransactionModelToJson(List<TransactionModel> data) {
  List<Map<String, dynamic>> newList = [];
  for (var element in data) {
    newList.add(element.toJson());
  }
  return json.encode(newList);
}

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    super.uuid,
    required super.user,
    required super.topUpOption,
    super.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        uuid: json["uuid"],
        user: UserModel.fromJson(json["user"]),
        topUpOption: json["top_up_option"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  factory TransactionModel.fromEntity(TransactionEntity transaction) => TransactionModel(
        uuid: transaction.uuid,
        user: transaction.user,
        topUpOption: transaction.topUpOption,
        createdAt: transaction.createdAt,
      );

  TransactionModel copyWith({
    String? uuid,
    UserModel? user,
    String? topUpOption,
    DateTime? createdAt,
  }) {
    return TransactionModel(
      uuid: uuid ?? this.uuid,
      user: user ?? this.user,
      topUpOption: topUpOption ?? this.topUpOption,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "user": UserModel.fromEntity(user).toJson(),
        "top_up_option": topUpOption,
        "created_at": createdAt?.toIso8601String(),
      };
}
