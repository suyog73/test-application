class UserModel {
  String? name;
  String? email;
  String? imageUrl;
  String? uid;
  

  UserModel({
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'imageUrl': imageUrl,
      'name': name,
      'email': email,
    };
  }
}
