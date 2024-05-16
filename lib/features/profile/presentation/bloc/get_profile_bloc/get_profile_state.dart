part of 'get_profile_bloc.dart';

sealed class GetProfileState extends Equatable {
  const GetProfileState();

  @override
  List<Object> get props => [];
}

final class GetProfileLoading extends GetProfileState {}

final class GetProfileLoaded extends GetProfileState {
  final UserModel userModel;

const  GetProfileLoaded({required this.userModel});

}


final class GetProfileFail extends GetProfileState {
  final AppAlert  errorMsg;
  const GetProfileFail({required this.errorMsg});
}
