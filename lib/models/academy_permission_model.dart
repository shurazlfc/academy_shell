class AcademyPermissionModel {
  int? id;
  int? value;
  String? name;
  String? guardName;
  String? group;
  String? displayName;
  String? label;
  String? createdAt;

  AcademyPermissionModel(
      {this.id,
        this.value,
        this.name,
        this.guardName,
        this.group,
        this.displayName,
        this.label,
        this.createdAt});

  AcademyPermissionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    name = json['name'];
    guardName = json['guard_name'];
    group = json['group'];
    displayName = json['display_name'];
    label = json['label'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['group'] = this.group;
    data['display_name'] = this.displayName;
    data['label'] = this.label;
    data['created_at'] = this.createdAt;
    return data;
  }
}
