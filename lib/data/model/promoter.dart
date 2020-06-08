import 'package:equatable/equatable.dart';

class Promoter extends Equatable{

  final String id;
  final String city;
  final String iconUrl;
  final String nameDisplay;

  Promoter({this.id, this.city, this.iconUrl, this.nameDisplay}) : super();

  @override
  List<Object> get props => [id, city, iconUrl, nameDisplay];

  factory Promoter.fromJson(Map<String, dynamic> json){
    return Promoter(
        id : json['id'],
        city: json['city'],
        iconUrl: json['iconUrl'],
        nameDisplay: json['nameDisplay']
    );
  }

}
