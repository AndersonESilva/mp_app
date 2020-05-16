
class EventResponse{

  final String productor;
  final String productorCity;
  final String title;
  final String description;
  final String datetime;
  final String address;

  EventResponse({this.productor, this.productorCity, this.title, this.description, this.datetime, this.address});

  factory EventResponse.fromJson(Map<String, dynamic> json){
    return EventResponse(
        productor : json['productor'],
        productorCity: json['productorCity'],
        title: json['title'],
        description: json['description'],
        datetime: json['datetime'],
        address: json['address']
    );
  }

}