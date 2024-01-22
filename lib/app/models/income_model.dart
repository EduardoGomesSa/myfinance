import 'dart:convert';

import 'package:myfinance/app/models/expense_model.dart';
import 'package:myfinance/app/models/user_model.dart';

class IncomeModel{
  int? id;
  num? value;
  String? title;
  num? remained;
  UserModel? user;
  DateTime? created;
  List<ExpenseModel>? expenses;

  IncomeModel({
    this.id,
    this.value,
    this.title,
    this.remained,
    this.user,
    this.created,
    this.expenses
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "value": value,
      "title": title,
      "remained": remained,
      "user_id": user!.id,
      "created": created?.millisecondsSinceEpoch,
      "expenses": expenses?.map((x) => x.toMap()).toList()
    };
  }

  factory IncomeModel.fromMap(Map<String, dynamic> map){
    return IncomeModel(
      id: map["id"]?.toInt(),
      value: map["value"]?.toInt(),
      title: map["title"],
      remained: map["remained"]?.toInt(),
      user: map["user"],
      created: map["created"] != null ? DateTime.parse(map["created"]) : null,
      expenses: map["expenses"] != null ? List<ExpenseModel>
        .from((map['expenses'] as List<dynamic>)
        .map<ExpenseModel?>((x) => ExpenseModel
        .fromMap(x as Map<String, dynamic>))) 
        : null
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
      other.title == title &&
      other.remained == remained &&
      other.user == user &&
      other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      value.hashCode ^
      title.hashCode ^
      remained.hashCode ^
      user.hashCode ^
      created.hashCode;
  }

  @override
  String toString() {
    return 'IncomeModel(id: $id, value: $value, title: $title, remained: $remained, createdAt: $created)';
  }
}