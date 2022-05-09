class RoleUserModel {
  List<Data>? data;

  RoleUserModel({this.data});

  RoleUserModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? displayName;
  String? name;
  String? guardName;
  int? noOfUsers;
  List<int>? permissions;

  Data(
      {this.id,
      this.displayName,
      this.name,
      this.guardName,
      this.noOfUsers,
      this.permissions});

  Data.fromJson(Map<String, dynamic> json) {
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
