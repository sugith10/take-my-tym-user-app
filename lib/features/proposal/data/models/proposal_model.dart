import 'package:take_my_tym/features/proposal/data/models/offer_model.dart';
import 'package:take_my_tym/features/proposal/data/models/submit_model.dart';

class ProposalModel {
  final List<SubmitModel> submitList;
  final List<OfferModel> offerList;
  ProposalModel({
    required this.submitList,
    required this.offerList,
  });

  @override
  String toString() {
   
    return 'SubmitList : $submitList, OfferList  $offerList';
  }
}
