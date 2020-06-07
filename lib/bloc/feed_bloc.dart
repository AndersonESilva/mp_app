import 'dart:async';
import 'package:mp_app/repository/feed_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mp_app/di/event/feed_event.dart';
import 'package:mp_app/di/state/feed_state.dart';
import 'package:bloc/bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {

  final FeedRepository _feedRepository = FeedRepository();

  @override
  Stream<Transition<FeedEvent, FeedState>> transformEvents(
      Stream<FeedEvent> events,
      TransitionFunction<FeedEvent, FeedState> transitionFn,
      ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  get initialState => FeedUninitialized();

  @override
  Stream<FeedState> mapEventToState(FeedEvent event) async* {
    final currentState = state;
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is FeedUninitialized) {
          final events = await _feedRepository.fetchEvents("5ab813f0-9b7a-11ea-b8e3-a79cef702be3", null);
          yield FeedLoaded(events: events, hasReachedMax: false);
          return;
        }
        if (currentState is FeedLoaded) {
          final count = currentState.events.length;
          final event = currentState.events.elementAt(count - 1);
          final events = await _feedRepository.fetchEvents("5ab813f0-9b7a-11ea-b8e3-a79cef702be3", event.id);
          yield events.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : FeedLoaded(events: currentState.events + events, hasReachedMax: false);
        }
      } catch (_) {
        yield FeedError();
      }
    }
  }

  bool _hasReachedMax(FeedState state) =>
      state is FeedLoaded && state.hasReachedMax;
}