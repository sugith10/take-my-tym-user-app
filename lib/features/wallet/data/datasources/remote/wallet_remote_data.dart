import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/wallet/data/models/transaction_model.dart';
import 'package:take_my_tym/features/wallet/data/models/wallet_model.dart';

class WalletRemoteData {
  final _walletRef = FirebaseFirestore.instance.collection('wallet');
  Future<WalletModel> getWalletBalance({required String uid}) async {
    try {
      final walletDocRef = _walletRef.doc(uid);
      final walletSnapShot = await walletDocRef.get();
      if (!walletSnapShot.exists) {
        await walletDocRef.set(
          WalletModel(balance: 0.0, transactions: []).toMap(),
        );

        return WalletModel(balance: 0.0, transactions: []);
      } else {
        final WalletModel walletModel =
            WalletModel.fromMap(walletSnapShot.data() as Map<String, dynamic>);
        return walletModel;
      }
    } catch (e) {
      throw AppException(
        alert: e.toString(),
        details: 'from WalletRemoteData',
      );
    }
  }

  Future<WalletModel> walletTopUp(
      {required String uid, required TransactionModel transactionModel}) async {
    try {
      final walletDocSnap = await _walletRef.doc(uid).get();

      if (walletDocSnap.exists) {
        final wallet = WalletModel.fromMap(walletDocSnap.data()!);
        wallet.balance += transactionModel.amount;
        wallet.transactions.add(transactionModel);
        await _walletRef.doc(uid).set(wallet.toMap());

        return wallet;
      } else {
        throw Exception('Wallet document not found for user $uid');
      }
    } catch (e) {
      throw Exception('Error topping up wallet');
    }
  }

  Future<WalletModel> walletWithdraw({
    required String uid,
    required TransactionModel transactionModel,
  }) async {
    try {
      final walletDocSnap = await _walletRef.doc(uid).get();

      if (walletDocSnap.exists) {
        final wallet = WalletModel.fromMap(walletDocSnap.data()!);
        //TODO - WHEN USER TRY TO WITHDRAW THE AMOUNT LESS THAN THE BALANCE RESTRICT IT
        if (transactionModel.amount <= wallet.balance) {
          wallet.balance -= transactionModel.amount;
          wallet.transactions.add(transactionModel);
          await _walletRef.doc(uid).set(wallet.toMap());

          return wallet;
        } else {
          throw Exception('Enter a amount less than wallet balance');
        }
      } else {
        throw Exception('Wallet document not found for user $uid');
      }
    } catch (e) {
      throw Exception('Error topping up wallet');
    }
  }
}
