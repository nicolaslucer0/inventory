import 'dart:convert';

ContainerModel containerModelFromJson(String str) {
  final jsonData = json.decode(str);
  return ContainerModel.fromMap(jsonData);
}

String containerModelToJson(ContainerModel data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class ContainerModel {
  int id;
  String name;
  String description;

  ContainerModel({
    this.id,
    this.name,
    this.description,
  });

  factory ContainerModel.fromMap(Map<String, dynamic> json) => new ContainerModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
      };
}