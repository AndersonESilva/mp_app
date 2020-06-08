
import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetch extends FeedEvent{
  @override
  String toString() => 'Fetch';
}

class RefreshFetch extends FeedEvent{
  @override
  String toString() => 'RefreshFetch';
}