import 'dart:convert';

import 'package:myfinance/app/models/bill_model.dart';
import 'package:myfinance/app/models/income_model.dart';

class ExpenseModel{
  int? id;
  num? value;
  BillModel? bill;
  IncomeModel? income;
  DateTime? createdAt;

  ExpenseModel({
    this.id,
    this.value,
    this.bill,
    this.income,
    this.createdAt
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "value": value,
      "bill_id": bill?.id,
      "income_id": income,
      "created_at": createdAt?.millisecondsSinceEpoch
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map){
    return ExpenseModel(
      id: map["id"]?.toInt(),
      value: map["value"]?.toNum(),
      bill: map["bill"] != null ? BillModel.fromMap(map["bill"]) : null,
      income: map["income"] != null ? IncomeModel.fromMap(map["income"]) : null,
      createdAt: map["createdAt"] != null ? DateTime.fromMillisecondsSinceEpoch(map["created_at"]) : null
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) => json.decode(source);

  static List<ExpenseModel> fromList(list){
    return List<ExpenseModel>.from(list.map((x) => ExpenseModel.fromMap(x)));
  }

  @override
  bool operator ==(covariant ExpenseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.value == value &&
      other.bill == bill &&
      other.income == income &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      value.hashCode ^
      income.hashCode ^
      bill.hashCode ^
      createdAt.hashCode;
  }

  @override
  String toString() {
    return 'ExpenseModel(id: $id, value: $value, createdAt: $createdAt)';
  }
}