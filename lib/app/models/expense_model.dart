import 'dart:convert';

import 'package:myfinance/app/models/bill_model.dart';
import 'package:myfinance/app/models/income_model.dart';

class ExpenseModel{
  int? id;
  num? value;
  BillModel? billModel;
  IncomeModel? incomeModel;
  DateTime? createdAt;

  ExpenseModel({
    this.id,
    this.value,
    this.billModel,
    this.incomeModel,
    this.createdAt
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "value": value,
      "bill_id": billModel?.id,
      "income_id": incomeModel,
      "created_at": createdAt?.millisecondsSinceEpoch
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map){
    return ExpenseModel(
      id: map["id"]?.toInt(),
      value: map["value"]?.toNum(),
      billModel: map["bill"] != null ? BillModel.fromMap(map["bill"]) : null,
      incomeModel: map["income"] != null ? IncomeModel.fromMap(map["income"]) : null,
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
      other.billModel == billModel &&
      other.incomeModel == incomeModel &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      value.hashCode ^
      incomeModel.hashCode ^
      billModel.hashCode ^
      createdAt.hashCode;
  }

  @override
  String toString() {
    return 'ExpenseModel(id: $id, value: $value, createdAt: $createdAt)';
  }
}