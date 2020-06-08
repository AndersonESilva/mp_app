import 'package:equatable/equatable.dart';
import 'package:mp_app/data/model/event.dart';

abstract class FeedState extends Equatable {
  FeedState([List props = const []]);

  @override
  List<Object> get props => [];
}

class FeedUninitialized extends FeedState {
  @override
  String toString() => 'PostUninitialized';
}

class FeedError extends FeedState {
  @override
  String toString() => 'FeedError';
}

class FeedLoaded extends FeedState {
  final List<Event> events;
  final bool hasReachedMax;

  FeedLoaded({
    this.events,
    this.hasReachedMax,
  }) : super([events, hasReachedMax]);

  FeedLoaded copyWith({
    List<Event> events,
    bool hasReachedMax,
  }) {
    return FeedLoaded(
      events: events ?? this.events,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [events, hasReachedMax];

  @override
  String toString() =>
      'FeedLoaded { events: ${events.length}, hasReachedMax: $hasReachedMax }';
}