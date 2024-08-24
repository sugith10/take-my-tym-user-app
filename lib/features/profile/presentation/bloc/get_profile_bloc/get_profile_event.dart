part of 'get_profile_bloc.dart';

class GetProfileEvent extends Equatable {
  final String userId;
  const GetProfileEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}