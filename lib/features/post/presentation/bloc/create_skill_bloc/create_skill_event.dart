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
