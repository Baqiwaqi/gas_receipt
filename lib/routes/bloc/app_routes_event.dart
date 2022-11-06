part of 'app_routes_bloc.dart';

abstract class RoutesEvent extends Equatable {
  const RoutesEvent();

  @override
  List<Object> get props => [];
}

class RoutesChanged extends RoutesEvent {
  const RoutesChanged({required this.index});
  final int index;

  @override
  List<Object> get props => [index];
}
