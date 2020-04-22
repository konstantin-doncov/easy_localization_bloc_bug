import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  MainState get initialState => InitialMainState();

  @override
  void onTransition(Transition<MainEvent, MainState> transition) {
    print(
        '${transition.currentState}//${transition.event}//${transition.nextState}');
    super.onTransition(transition);
  }

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is ReadyEvent) yield ReadyState();
  }
}
