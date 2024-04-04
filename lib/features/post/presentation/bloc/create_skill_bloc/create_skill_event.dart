part of 'create_skill_bloc.dart';

sealed class CreateSkillEvent extends Equatable {
  const CreateSkillEvent();

  @override
  List<Object> get props => [];
}

final class AddSkillEvent extends CreateSkillEvent {
  final String skill;
  const AddSkillEvent({required this.skill});
}

class RemoveSkillEvent extends CreateSkillEvent {
  final String skill;
  const RemoveSkillEvent({required this.skill});
}

final class AddAllSkillEvent extends CreateSkillEvent {
  final List<dynamic>? skill;
  const AddAllSkillEvent({required this.skill});
}

final class ClearSkillsEvent extends CreateSkillEvent {}
