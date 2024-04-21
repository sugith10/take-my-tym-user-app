import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'commune_sell_tym_post_event.dart';
part 'commune_sell_tym_post_state.dart';

class CommuneSellTymPostBloc extends Bloc<CommuneSellTymPostEvent, CommuneSellTymPostState> {
  CommuneSellTymPostBloc() : super(CommuneSellTymPostInitial()) {
    on<CommuneSellTymPostEvent>((event, emit) {
     
    });
  }
}
