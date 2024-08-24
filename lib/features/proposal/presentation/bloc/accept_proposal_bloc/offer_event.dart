part of 'offer_bloc.dart';

sealed class OfferEvent extends Equatable {
  const OfferEvent();

  @override
  List<Object> get props => [];
}

final class OfferDetailsEvent extends OfferEvent {
  final OfferModel offerModel;

  const OfferDetailsEvent({
    required this.offerModel,
  });
}

final class OfferRejectEvent extends OfferEvent {
  final OfferModel offerModel;
  final String userId;
  const OfferRejectEvent({required this.userId, required this.offerModel});
}

final class OfferAcceptEvent extends OfferEvent {
  final String userId;
  final OfferModel offerModel;

  final String paymentId;
  final PostModel postModel;
  const OfferAcceptEvent({
    required this.userId,
    required this.postModel,
    required this.paymentId,
    required this.offerModel,
  });
}
