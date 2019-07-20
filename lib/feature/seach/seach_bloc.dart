import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:mp_app/feature/service/api_client.dart';
import 'package:mp_app/modal/events.dart';

class SeachBloc implements BlocBase{

  ApiClient apiClient;

  List<Events> events;

  final StreamController<List<Events>> _eventsController = StreamController<List<Events>>();
  Stream get outEvents => _eventsController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  void _search(String search) async {

    if(search != null){
      _eventsController.sink.add([]);
      events = await apiClient.search(search);
    }
    _eventsController.sink.add(events);
  }

  @override
  void dispose() {
    _eventsController.close();
    _searchController.close();
  }

}