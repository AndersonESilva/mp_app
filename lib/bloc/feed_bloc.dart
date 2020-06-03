import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:mp_app/data/model/event.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mp_app/di/event/feed_event.dart';
import 'package:mp_app/di/state/feed_state.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final http.Client httpClient;

  FeedBloc({@required this.httpClient});

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
          final events = await _fetchPosts(0, 20);
          yield FeedLoaded(events: events, hasReachedMax: false);
          return;
        }
        if (currentState is FeedLoaded) {
          final events = await _fetchPosts(currentState.events.length, 20);
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

  Future<List<Event>> _fetchPosts(int startIndex, int limit) async {
    final response = await httpClient.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}