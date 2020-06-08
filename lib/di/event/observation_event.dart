import 'package:equatable/equatable.dart';

abstract class ObservationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ObservationInit extends ObservationEvent {
  final bool observation;

  ObservationInit(this.observation);

  @override
  String toString() => 'Uninitialized';
}

class ObservationChange extends ObservationEvent {
  final String idEvent;

  ObservationChange(this.idEvent);

  @override
  String toString() => 'ObservationChange';
}
