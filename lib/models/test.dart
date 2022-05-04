import 'dart:convert';

class Test {
  String? id;
  String? name;
  String? address;
  Test({
    this.id,
    this.name,
    this.address,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(name != null){
      result.addAll({'name': name});
    }
    if(address != null){
      result.addAll({'address': address});
    }
  
    return result;
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      id: map['id'],
      name: map['name'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Test.fromJson(String source) => Test.fromMap(json.decode(source));

  Test copyWith({
    String? id,
    String? name,
    String? address,
  }) {
    return Test(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }
}
