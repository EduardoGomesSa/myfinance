import 'dart:convert';

class BillModel{
  int? id;
  String? name;
  DateTime? createdAt;

  BillModel({
    this.id,
    this.name,
    this.createdAt
  });

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "created_at": createdAt?.millisecondsSinceEpoch
    };
  }

  factory BillModel.fromMap(Map<String, dynamic> map){
    return BillModel(
      id: map["id"]?.toInt(),
      name: map["name"],
      createdAt: map["created_at"] != null ? DateTime.fromMillisecondsSinceEpoch(map["created_at"]) : null
    );
  }

  String tojson() => json.encode(toMap());

  factory BillModel.fromjson(String source) => json.decode(source);

  static List<BillModel> fromList(list){
    return List<BillModel>.from(list.map((x) => BillModel.fromMap(x)));
  }

  @override
  bool operator ==(covariant BillModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      createdAt.hashCode;
  }

  @override
  String toString() {
    return 'BillModel(id: $id, name: $name, createdAt: $createdAt)';
  }
}