// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_routes_event.dart';
part 'app_routes_state.dart';

class RoutesBloc extends Bloc<RoutesEvent, RoutesState> {
  RoutesBloc()
      : super(
            const RoutesState._(status: RoutesStatus.receiptRoute, index: 0)) {
    on<RoutesChanged>(_onRoutesChanged);
  }

  void _onRoutesChanged(RoutesChanged event, Emitter<RoutesState> emmit) {
    switch (event.index) {
      case 0:
        emit(const RoutesState._(status: RoutesStatus.receiptRoute, index: 0));
        break;
      case 1:
        emit(const RoutesState._(status: RoutesStatus.workoutRoute, index: 1));
        break;
      case 2:
        emit(const RoutesState._(
            status: RoutesStatus.statisticsRoute, index: 2));
        break;
      case 3:
        emit(const RoutesState._(status: RoutesStatus.settingsRoute, index: 3));
        break;
    }
  }
}
