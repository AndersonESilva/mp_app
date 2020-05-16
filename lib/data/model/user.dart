

class User {
  final String id;
  final String displayName;
  final String email;
  final String photoUrl;
  final String userID;

  User(this.id, this.displayName, this.email, this.photoUrl, this.userID);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        displayName = json['displayName'],
        email = json['email'],
        photoUrl = json['photoUrl'],
        userID = json['userID'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'displayName': displayName,
        'email': email,
        'photoUrl': photoUrl,
        'userID': userID,
      };
}
