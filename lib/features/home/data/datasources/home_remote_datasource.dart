import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_up_test/features/home/data/models/transaction_model.dart';
import 'package:top_up_test/features/home/home_constant.dart';

abstract class HomeRemoteDatasource {
  Future<TransactionModel> createTransaction(TransactionModel transactionModel);
  Future<List<TransactionModel>> getTransactions();
  Future<void> clearAllData();
}

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final SharedPreferences sharedPreferences;
  HomeRemoteDatasourceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<TransactionModel> createTransaction(TransactionModel transactionModel) async {
    List<TransactionModel> listTransactionModel = [];
    final String? data = sharedPreferences.getString(kTransactionKey);

    if (data != null) {
      listTransactionModel.addAll(transactionModelFromJson(data));
    }

    listTransactionModel.add(transactionModel);

    await sharedPreferences.setString(
      kTransactionKey,
      listTransactionModelToJson(listTransactionModel),
    );

    return transactionModel;
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    List<TransactionModel> listTransactionModel = [];
    final String? data = sharedPreferences.getString(kTransactionKey);

    if (data != null) {
      listTransactionModel.addAll(transactionModelFromJson(data));
    }
    return listTransactionModel;
  }

  @override
  Future<void> clearAllData() async {
    sharedPreferences.clear();
  }
}
