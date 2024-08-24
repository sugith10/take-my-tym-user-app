part of 'offer_bloc.dart';

sealed class OfferState extends Equatable {
  const OfferState();

  @override
  List<Object> get props => [];
}

final class OfferInitial extends OfferState {}

final class OfferLoading extends OfferState {}

final class OfferLoaded extends OfferState {
  final OfferModel offerModel;
  final UserModel userModel;
  final PostModel postModel;
  const OfferLoaded({
    required this.offerModel,
    required this.postModel,
    required this.userModel,
  });
}

final class OfferSuccess extends OfferState{}

final class ProopsalFailedState extends OfferState{}