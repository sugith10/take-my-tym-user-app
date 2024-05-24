import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:take_my_tym/core/model/app_user_model.dart';
import 'package:take_my_tym/core/utils/app_error_msg.dart';
import 'package:take_my_tym/core/utils/app_exception.dart';
import 'package:take_my_tym/core/model/app_post_model.dart';
import 'package:take_my_tym/features/create_post/domain/usecases/create_post_usecase.dart';

import '../../../domain/usecases/update_post_usecase.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  // First page data
  String? _postId;
  String? _uid;
  String? _userName;
  bool? _tymType;
  String? _workType;
  String? _title;
  String? _content;
  Timestamp? _postDate;
  // Second page data
  List<String>? _skills;
  String? _location;
  String? _experience;
  double? _remuneration;
  CreatePostBloc() : super(CreatePostInitial()) {
    on<CreatPostFailEvent>(_failEvent);

    on<CreateFirstPageEvent>(_onFirstPageEvent);

    on<CreateSecondPageEvent>(_onSecondPageEvent);

    on<UpdateFirstPageEvent>(_onUpdateFirstPageEvent);

    on<UpdateSecondPageEvent>(_onUpdateSecondPageEvent);
  }

  /// Manages user create post input on the first page and collects required data to proceed to the next page.
  void _onFirstPageEvent(
      CreateFirstPageEvent event, Emitter<CreatePostState> emit) {
    // Check if the title is at least 3 characters long
    if (event.title.length <= 3) {
      // If not, show an error message and return
      final error = AppAlert(
        alert: 'Give proper title',
        details:
            'Gave a proper title, Other wise its harder for other to understand it',
      );
      emit(
        CreatePostFailState(
          error: error,
        ),
      );
      return;
    } else // Check if the content is at least 10 characters long
    if (event.content.length <= 10) {
      // If not, show an error message and return
      final error = AppAlert(
        alert: 'Give proper decription',
        details:
            'Gave a proper decription, Other wise its harder for other to understand it',
      );
      emit(
        CreatePostFailState(error: error),
      );
      return;
    } else {
      // If the title and content are valid, store the data and proceed to the next page
      _uid = event.userModel.uid;
      _userName = "${event.userModel.firstName} ${event.userModel.lastName}";
      _tymType = event.tymType;
      _workType = event.workType;
      _title = event.title;
      _content = event.content;
      emit(CreateFirstSuccessState());
    }
  }

  /// Manages user create post input on the second page and with the previous page's data, attempts to create a post.
  void _onSecondPageEvent(
      CreateSecondPageEvent event, Emitter<CreatePostState> emit) async {
    emit(CreatPostLoadingState());
    if (event.experience.length <= 2) {
      emit(
        CreatePostFailState(error: AppAlert()),
      );
      return;
    } else {
      final error = AppAlert(
          alert: "Invalid Remuneration",
          details:
              "Please enter a remuneration amount that falls within the acceptable range.");
      try {
        _remuneration = double.parse(event.remuneration);
      } catch (e) {
        emit(
          CreatePostFailState(
            error: error,
          ),
        );
        return;
      }
      if (_remuneration! < 500 || _remuneration! >= 100000) {
        log("on error");
        emit(
          CreatePostFailState(
            error: error,
          ),
        );
        return;
      } else {
        log("data adding success");
        _skills = event.skills;
        _location = event.location;
        _experience = event.experience;
      }
    }
    //Post Data
    if (_uid != null &&
        _userName != null &&
        _tymType != null &&
        _workType != null &&
        _title != null &&
        _content != null &&
        _skills != null &&
        _location != null &&
        _experience != null &&
        _remuneration != null) {
      CreatePostUseCase createPostUseCase = GetIt.instance<CreatePostUseCase>();

      if (_tymType != null && _tymType == true) {
        try {
          final Timestamp timestamp = Timestamp.now();
          final bool res = await createPostUseCase.buyTymPost(
            postModel: PostModel(
              tymType: true,
              uid: _uid!,
              workType: _workType!,
              title: _title!,
              content: _content!,
              userName: _userName!,
              postDate: timestamp,
              skills: _skills!,
              location: _location!,
              skillLevel: _experience!,
              price: _remuneration!,
              latitude: event.latitude,
              longitude: event.longitude,
            ),
          );
          if (res) {
            log("success buy");
            emit(CreatePostSuccessState(refreshType: true, uid: _uid!));
          } else {
            emit(
              RemoteDataAddFailState(
                error: AppAlert(),
              ),
            );
          }
        } on AppException {
          emit(
            RemoteDataAddFailState(error: AppAlert()),
          );
        } catch (e) {
          emit(
            RemoteDataAddFailState(error: AppAlert()),
          );
        }
      } else if (_tymType != null && _tymType == false) {
        try {
          final Timestamp timestamp = Timestamp.now();
          final bool res = await createPostUseCase.sellTymPost(
            postModel: PostModel(
              tymType: false,
              uid: _uid!,
              workType: _workType!,
              title: _title!,
              content: _content!,
              userName: _userName!,
              postDate: timestamp,
              location: _location!,
              skillLevel: _experience!,
              price: _remuneration!,
              skills: _skills!,
              latitude: event.latitude,
              longitude: event.longitude,
            ),
          );
          if (res) {
            emit(CreatePostSuccessState(refreshType: false, uid: _uid!));
          } else {
            emit(
              RemoteDataAddFailState(error: AppAlert()),
            );
          }
        } on AppException {
          emit(
            RemoteDataAddFailState(error: AppAlert()),
          );
        } catch (e) {
          RemoteDataAddFailState(error: AppAlert());
        }
      } else {
        log("something went wrong come to bloc line 163");
      }
    }
  }

  /// Manages user update post input on the first page and collects required data to proceed to the next page.
  void _onUpdateFirstPageEvent(
      UpdateFirstPageEvent event, Emitter<CreatePostState> emit) {
    emit(CreatPostLoadingState());
    _title = event.title.trim();
    _content = event.content.trim();
    if (_title!.length <= 3) {
      final AppAlert error = AppAlert(
          alert: 'Give proper title',
          details:
              'Gave a proper title, Other wise its harder for other to understand it');
      emit(
        CreatePostFailState(error: error),
      );
      return;
    } else if (_content!.length <= 10) {
      final AppAlert error = AppAlert(
          alert: 'Give proper decription',
          details:
              'Gave a proper decription, Other wise its harder for other to understand it');
      emit(
        CreatePostFailState(
          error: error,
        ),
      );
      return;
    } else {
      _postId = event.postModel.postId!;
      _uid = event.postModel.uid;
      _userName = event.postModel.userName;
      _postDate = event.postModel.postDate;
      _tymType = event.postModel.tymType;
      _workType = event.workType;
      log("update success");
      emit(CreateFirstSuccessState());
    }
  }

  /// Manages user update post input on the second page and with the previous page's data, attempts to create a post.
  void _onUpdateSecondPageEvent(
      UpdateSecondPageEvent event, Emitter<CreatePostState> emit) async {
    log("update second bloc");
    emit(CreatPostLoadingState());

    try {
      _remuneration = double.parse(event.remuneration);
    } catch (e) {
      log("3");
      emit(
        CreatePostFailState(error: AppAlert()),
      );
      return;
    }
    if (_remuneration! >= 1000000) {
      log("4");
      emit(CreatePostFailState(error: AppAlert()));
      return;
    } else {
      log("data adding success");
      _skills = event.skills;
      _location = event.location;
      _experience = event.experience;
    }

    //Post Data
    if (_postId != null &&
        _uid != null &&
        _userName != null &&
        _tymType != null &&
        _workType != null &&
        _title != null &&
        _content != null &&
        _skills != null &&
        _location != null &&
        _experience != null &&
        _remuneration != null) {
      UpdatePostUseCase updatePostUseCase = GetIt.instance<UpdatePostUseCase>();
      if (_tymType != null && _tymType == true) {
        try {
          await updatePostUseCase
              .updateBuyTymPost(
                  postModel: PostModel(
            postId: _postId,
            tymType: _tymType!,
            uid: _uid!,
            workType: _workType!,
            title: _title!,
            content: _content!,
            userName: _userName!,
            postDate: _postDate!,
            location: _location!,
            skillLevel: _experience!,
            price: _remuneration!,
            skills: _skills!,
            latitude: event.latitude,
            longitude: event.longitude,
          ))
              .then((value) {
            emit(UpdatePostSuccessState(refreshType: _tymType!, uid: _uid!));
          });
        } on AppException {
          emit(
            RemoteDataAddFailState(
              error: AppAlert(),
            ),
          );
        } catch (e) {
          emit(
            RemoteDataAddFailState(
              error: AppAlert(),
            ),
          );
        }
      } else if (_tymType != null && _tymType == false) {
        try {
          await updatePostUseCase
              .updateSellTymPost(
            postModel: PostModel(
              postId: _postId,
              tymType: _tymType!,
              uid: _uid!,
              workType: _workType!,
              title: _title!,
              content: _content!,
              userName: _userName!,
              postDate: _postDate!,
              location: _location!,
              skillLevel: _experience!,
              price: _remuneration!,
              skills: _skills!,
              latitude: event.latitude,
              longitude: event.longitude,
            ),
          )
              .then((value) {
            emit(CreatePostSuccessState(refreshType: _tymType!, uid: _uid!));
          });
        } on AppException {
          emit(CreatePostFailState(error: AppAlert()));
        } catch (e) {
          emit(
            CreatePostFailState(
              error: AppAlert(),
            ),
          );
        }
      } else {
        log("something went wrong come to bloc line 177");
      }
    }
  }

  /// Manages the failure event for creating a post, emitting a fail state with an alert.
  void _failEvent(CreatPostFailEvent event, Emitter<CreatePostState> emit) {
    // Emit a fail state with an alert
    emit(
      CreatePostFailState(
        error: AppAlert(
          alert: "Relevant Details Are Missing",
          details:
              "It seems like you missed something. Please make sure to fill in all fields.",
        ),
      ),
    );
  }
}
