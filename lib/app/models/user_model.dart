import 'dart:convert';

class UserModel{
  int? id;
  String? name;
  String? email;
  String? password;
  DateTime? createdAt;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.createdAt,
    this.token
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "created_at": createdAt?.millisecondsSinceEpoch,
      "token": token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      id: map["id"]?.toInt(),
      name: map["name"],
      email: map["email"],
      password: map["password"],
      createdAt: map["created_at"] != null ? DateTime.fromMillisecondsSinceEpoch(map["created_at"]) : null,
      token: map["token"]
    );
  }

  static List<UserModel> fromList(list){
    return List<UserModel>.from(list.map((x) => UserModel.fromMap(x)));
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, password: $password, createdAt: $createdAt, token: $token)';
  }
}