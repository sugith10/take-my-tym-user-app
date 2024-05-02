import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/features/wallet/data/models/wallet_model.dart';

class WalletRemoteData {
  Future<WalletModel> getWalletBalance({required String uid}) async {
    try {
      final walletDocRef =
          FirebaseFirestore.instance.collection('wallet').doc(uid);
      final walletSnapShot = await walletDocRef.get();
      if (!walletSnapShot.exists) {
        await walletDocRef.set(
          WalletModel(balance: 0.0, transactions: []).toMap(),
        );
        log("success");
        return WalletModel(balance: 0.0, transactions: []);
      } else {
        return WalletModel(balance: 0.0, transactions: []);
      }
    } catch (e) {
      log(e.toString());
      throw AppException(
        alert: e.toString(),
        details: 'from WalletRemoteData',
      );
    }
  }
}
