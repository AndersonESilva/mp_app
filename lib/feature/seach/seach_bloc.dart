import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:mp_app/feature/service/api_client.dart';
import 'package:mp_app/modal/events.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc implements BlocBase{

  ApiClient apiClient;

  List<Events> events;

  final _eventsController = StreamController<List<Events>>();
  Stream get outEvents => _eventsController.stream;

  final _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  SearchBloc(){
    apiClient = ApiClient();

    _searchController.stream.listen(_search);
  }

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

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }

}