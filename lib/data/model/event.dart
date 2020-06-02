import 'package:equatable/equatable.dart';
import 'package:mp_app/data/model/promoter.dart';

class Event extends Equatable {

  final String id;
  final String title;
  final String banner;
  final bool observed;
  final Promoter promoter;

  Event({this.id, this.title, this.banner, this.observed, this.promoter}) : super();

  @override
  List<Object> get props =>[id, title, banner, observed, promoter];

  factory Event.fromJson(Map<String, dynamic> json){
    return Event(
        id : json['id'],
        title: json['title'],
        banner: json['banner'],
        observed: json['observed'],
        promoter: json['promoter']
    );
  }

}
