import 'package:equatable/equatable.dart';
import 'package:mp_app/data/model/event.dart';

abstract class ObservationState extends Equatable {
  ObservationState([List props = const []]);

  @override
  List<Object> get props => [];
}

class Uninitialized extends ObservationState {
  @override
  String toString() => 'Uninitialized';
}

class Observing extends ObservationState {
  @override
  String toString() => 'Observe';
}

class UnObserving extends ObservationState {
  @override
  String toString() => 'Unobserve';
}
