part of 'create_skill_bloc.dart';

sealed class CreateSkillState {
  const CreateSkillState();
}

final class CreateSkillInitial extends CreateSkillState {}

final class UpdateSkillSuccessState extends CreateSkillState {
  final List<String> skills;
  const UpdateSkillSuccessState({required this.skills});
}
