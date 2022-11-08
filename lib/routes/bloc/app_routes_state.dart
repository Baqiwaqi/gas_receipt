part of 'app_routes_bloc.dart';

// abstract class RoutesState {}

// class StateExercisesRoute extends RoutesState {}

// class StateWorkoutRoute extends RoutesState {}

// class StateStatisticsRoute extends RoutesState {}

// class StateTraingplanRoute extends RoutesState {}

enum RoutesStatus { receiptRoute, statisticsRoute, settingsRoute }

class RoutesState extends Equatable {
  const RoutesState._({
    required this.status,
    required this.index,
  });

  final RoutesStatus status;
  final int index;

  @override
  List<Object?> get props => [status, index];
}
