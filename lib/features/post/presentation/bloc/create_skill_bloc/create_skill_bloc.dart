import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_skill_event.dart';
part 'create_skill_state.dart';

class CreateSkillBloc extends Bloc<CreateSkillEvent, CreateSkillState> {
  List<String> skills = [];
  CreateSkillBloc() : super(CreateSkillInitial()) {
    on<RemoveSkillEvent>((event, emit) {
      if (skills.isEmpty) {
      } else {
        skills.remove(event.skill);
        if (skills.isEmpty) {
          emit(CreateSkillInitial());
        } else {
          emit(UpdateSkillSuccessState(skills: skills));
        }
      }
    });
    on<AddSkillEvent>((event, emit) {
      if (event.skill.isNotEmpty) {
        if (skills.length >= 5) {
          log("sills length exceeded");
        } else {
          skills.add(event.skill);
          log(skills.length.toString());
          log(skills.toString());
          emit(UpdateSkillSuccessState(skills: skills));
        }
      } else {
        log('skill is empty');
      }
    });
  }
}
