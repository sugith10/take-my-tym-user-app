import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_skill_event.dart';
part 'create_skill_state.dart';

class CreateSkillBloc extends Bloc<CreateSkillEvent, CreateSkillState> {
  CreateSkillBloc() : super(CreateSkillInitial()) {
    Set<String> skills = {};
    on<RemoveSkillEvent>((event, emit) {
      if (skills.isEmpty) {
      } else {
        log(skills.length.toString());
        skills.remove(event.skill);
        if (skills.isEmpty) {
          emit(CreateSkillInitial());
        } else {
          emit(UpdateSkillSuccessState(skills: skills.toList()));
        }
      }
    });

    on<AddSkillEvent>(
      (event, emit) {
        log("one add skill");
        log(event.skill.length.toString());
        if (event.skill.isNotEmpty) {
          if (skills.length >= 5) {
            log("sills length exceeded");
          } else {
            skills.add(event.skill);
            log(skills.length.toString());
            log(skills.toString());
            emit(UpdateSkillSuccessState(skills: skills.toList()));
          }
        } else {
          emit(CreateSkillInitial());
        }
      },
    );

    on<AddAllSkillEvent>(
      (event, emit) {
        log('one add all');
        emit(CreateSkillInitial());
        if (event.skill.isEmpty) {
          return emit(CreateSkillInitial());
        }
        skills.addAll(event.skill.cast<String>());
        emit(UpdateSkillSuccessState(skills: skills.toList()));
      },
    );

    on<ClearSkillsEvent>(
      (event, emit) {
        emit(CreateSkillInitial());
        skills.clear();
      },
    );
  }
}
