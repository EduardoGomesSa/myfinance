import 'dart:convert';

import 'package:myfinance/app/models/user_model.dart';

class IncomeModel{
  int? id;
  num? value;
  num? remained;
  UserModel? user;
  DateTime? createdAt;

  IncomeModel({
    this.id,
    this.value,
    this.remained,
    this.user,
    this.createdAt
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "value": value,
      "remained": remained,
      "user_id": user!.id,
      "created_at": createdAt?.millisecondsSinceEpoch
    };
  }

  factory IncomeModel.fromMap(Map<String, dynamic> map){
    return IncomeModel(
      id: map["id"]?.toInt(),
      value: map["value"]?.toInt(),
      remained: map["remained"]?.toNum(),
      user: map["user"],
      createdAt: map["createdAt"] != null ? DateTime.fromMillisecondsSinceEpoch(map["created_at"]) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IncomeModel.fromJson(String source) => json.decode(source);

  static List<IncomeModel> fromList(list){
    return List<IncomeModel>.from(list.map((x) => IncomeModel.fromMap(x)));
  }

  @override
  bool operator ==(covariant IncomeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.value == value &&
      other.remained == remained &&
      other.user == user &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      value.hashCode ^
      remained.hashCode ^
      user.hashCode ^
      createdAt.hashCode;
  }

  @override
  String toString() {
    return 'IncomeModel(id: $id, value: $value, remained: $remained, createdAt: $createdAt)';
  }
}