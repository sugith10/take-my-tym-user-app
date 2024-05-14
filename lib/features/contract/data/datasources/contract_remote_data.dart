import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';
import 'package:take_my_tym/features/contract/data/models/contract_model.dart';

class ContractRemoteData {
  final _ref = FirebaseFirestore.instance.collection("contracts");

  Future<(List<ContractModel>, List<ContractModel>)> activeContracts(
      {required String userId}) async {
    log("user id: $userId");
    try {
      List<ContractModel> contractList = [];
      List<ContractModel> serviceProviderList = [];
      final serviceProviderContracts = await _ref
          .where("serviceProviderId", isEqualTo: userId)
          .where("contractEnded", isEqualTo: false)
          .get();
      final clientContracts = await _ref
          .where('clientId', isEqualTo: userId)
          .where("contractEnded", isEqualTo: false)
          .get();

      if (clientContracts.docs.isNotEmpty) {
        contractList = clientContracts.docs.map((map) {
          return ContractModel.fromMap(map.data());
        }).toList();
      }
      if (serviceProviderContracts.docs.isNotEmpty) {
        serviceProviderList = serviceProviderContracts.docs.map((map) {
          return ContractModel.fromMap(map.data());
        }).toList();
      }
      log("loading done: $userId");
      return (contractList, serviceProviderList);
    } catch (e) {
      appLogger.e("Error fetching contracts: $e");
      throw AppException(alert: e.toString(), details: e.toString());
    }
  }

  Future<(List<ContractModel>, List<ContractModel>)> completedContracts(
      {required String userId}) async {
    try {
      List<ContractModel> contractList = [];
      List<ContractModel> serviceProviderList = [];
      final clientContracts = await _ref
          .where('clientId', isEqualTo: userId)
          .where("contractEnded", isEqualTo: true)
          .get();
      final serviceProviderContracts = await _ref
          .where("serviceProviderId", isEqualTo: userId)
          .where("contractEnded", isEqualTo: true)
          .get();

      if (clientContracts.docs.isNotEmpty) {
        contractList = clientContracts.docs.map((map) {
          return ContractModel.fromMap(map.data());
        }).toList();
      }
      if (serviceProviderContracts.docs.isNotEmpty) {
        serviceProviderList = serviceProviderContracts.docs.map((map) {
          return ContractModel.fromMap(map.data());
        }).toList();
      }
      return (contractList, serviceProviderList);
    } catch (e) {
      appLogger.e("Error fetching contracts: $e");
      throw AppException(alert: e.toString(), details: e.toString());
    }
  }
}
