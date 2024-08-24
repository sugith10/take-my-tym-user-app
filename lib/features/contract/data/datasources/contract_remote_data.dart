import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_my_tym/core/util/app_exception.dart';
import 'package:take_my_tym/core/util/app_logger.dart';
import 'package:take_my_tym/features/contract/data/models/contract_model.dart';

class ContractRemoteData {
  final _ref = FirebaseFirestore.instance.collection("contracts");

  Future<(List<ContractModel>, List<ContractModel>)> activeContracts(
      {required String userId}) async {
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
          return ContractModel.fromMap(map.data(), map.id);
        }).toList();
      }
      if (serviceProviderContracts.docs.isNotEmpty) {
        serviceProviderList = serviceProviderContracts.docs.map((map) {
          return ContractModel.fromMap(map.data(), map.id);
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
          return ContractModel.fromMap(map.data(), map.id);
        }).toList();
      }
      if (serviceProviderContracts.docs.isNotEmpty) {
        serviceProviderList = serviceProviderContracts.docs.map((map) {
          return ContractModel.fromMap(map.data(), map.id);
        }).toList();
      }
      return (contractList, serviceProviderList);
    } catch (e) {
      appLogger.e("Error fetching contracts: $e");
      throw AppException(alert: e.toString(), details: e.toString());
    }
  }

  Future<void> finishContract({
    required ContractModel contractModel,
  }) async {
    try {
      await _ref.doc(contractModel.contractId).set(contractModel.toMap());
           appLogger.i(contractModel);
      return;
    } catch (e) {
      throw AppException(alert: e.toString());
    }
  }

  Future<void> contractCustomerService({
    required ContractModel contractModel,
    required String msg,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("contracts")
          .add({"message": msg});
      return;
    } catch (e) {
      throw AppException(alert: e.toString());
    }
  }
}
