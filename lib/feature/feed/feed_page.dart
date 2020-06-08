import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/bloc/feed_bloc.dart';
import 'package:mp_app/di/event/feed_event.dart';
import 'package:mp_app/di/state/feed_state.dart';

import 'feed_widget_event.dart';

class FeedPage extends StatefulWidget {

  @override
  _FeedPagePageState createState() => _FeedPagePageState();
}

class _FeedPagePageState extends State<FeedPage> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  FeedBloc _feedBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _feedBloc = BlocProvider.of<FeedBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      // ignore: missing_return
      builder: (context, state){
        if (state is FeedUninitialized){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is FeedError){
          return Center(
            child: Text('failed to fetch posts'),
          );
        }

        if (state is FeedLoaded){
          if(state.events.isEmpty){
            return Center(
              child: Text('no posts'),
            );
          }
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.events.length
                    ? _bottomLoader()
                    : FeedWidgetEvent(event: state.events[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.events.length
                  : state.events.length + 1,
              controller: _scrollController,
            ),
          );
        }
      },
    );
  }

  Widget _bottomLoader(){
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _feedBloc.add(Fetch());
    }
  }

  Future<Null> _refresh() async{
    _feedBloc.add(RefreshFetch());
    await Future.delayed(Duration(seconds: 1));
    return null;
  }
}
