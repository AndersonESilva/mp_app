
class Events {

  final String id;
  final String type;

  Events({this.id, this.type});

  factory Events.fromJson(Map<String, dynamic> json){
    return Events(
        id: json["id"],
        type: json["type"]
    );

  }

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "type": type
    };
  }
}