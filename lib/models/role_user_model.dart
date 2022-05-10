class RoleUserModel {
  int? id;
  String? displayName;
  String? name;
  String? guardName;
  int? noOfUsers;
  List<int>? permissions;

  RoleUserModel(
      {this.id,
      this.displayName,
      this.name,
      this.guardName,
      this.noOfUsers,
      this.permissions});

  RoleUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    name = json['name'];
    guardName = json['guard_name'];
    noOfUsers = json['no_of_users'];
    permissions = json['permissions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['no_of_users'] = this.noOfUsers;
    data['permissions'] = this.permissions;
    return data;
  }
}
