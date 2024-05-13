import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_my_tym/core/utils/app_logger.dart';



class AppBlocObserver extends BlocObserver {
  // ///We can run something, when we create our Bloc
  // @override
  // void onCreate(BlocBase bloc) {
  //   super.onCreate(bloc);

  //   ///We can check, if the BlocBase is a Bloc or a Cubit
  //   if (bloc is Cubit) {
  //     appLogger.t("This is a Cubit");
  //   } else {
  //     appLogger.i("This is a Bloc");
  //   }
  // }

  ///We can react to events
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    appLogger.t("An event Happened in $bloc the event is $event");
  }

  // /We can react to states
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    appLogger.t('A new state from $bloc the state is $change');
  }

  ///We can even react to transitions
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    /// With this we can specifically know, when and what changed in our Bloc
    appLogger.t(
        "There was a transition from ${transition.currentState} to ${transition.nextState}");
  }

  ///We can react to errors, and we will know the error and the StackTrace
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    appLogger.t(
        "Error happened in $bloc with error $error and the stacktrace is $stackTrace");
  }

  ///We can even run something, when we close our Bloc
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    appLogger.t("$bloc is closed");
  }
}
