class LoginResponse {
  int? id;
  String? name;
  String? mobileNumber;
  int? isAdmin;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? email;
  int? academyId;
  String? token;

  LoginResponse(
      {this.id,
      this.name,
      this.mobileNumber,
      this.isAdmin,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.email,
      this.academyId,
      this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    email = json['email'];
    academyId = json['academy_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile_number'] = this.mobileNumber;
    data['is_admin'] = this.isAdmin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['email'] = this.email;
    data['academy_id'] = this.academyId;
    data['token'] = this.token;
    return data;
  }
}

  
class Data {
  int? id;
  String? name;
  String? mobileNumber;
  String? email;
  int? academyId;
  Academy? academy;
  String? createdAt;
  int? role;
  RoleParsed? roleParsed;
  List<Permissions>? permissions;

  Data(
      {this.id,
      this.name,
      this.mobileNumber,
      this.email,
      this.academyId,
      this.academy,
      this.createdAt,
      this.role,
      this.roleParsed,
      this.permissions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    academyId = json['academy_id'];
    academy =
        json['academy'] != null ? new Academy.fromJson(json['academy']) : null;
    createdAt = json['created_at'];
    role = json['role'];
    roleParsed = json['roleParsed'] != null
        ? new RoleParsed.fromJson(json['roleParsed'])
        : null;
    if (json['permissions'] != null) {
      permissions = <Permissions>[];
      json['permissions'].forEach((v) {
        permissions!.add(new Permissions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['academy_id'] = this.academyId;
    if (this.academy != null) {
      data['academy'] = this.academy!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['role'] = this.role;
    if (this.roleParsed != null) {
      data['roleParsed'] = this.roleParsed!.toJson();
    }
    if (this.permissions != null) {
      data['permissions'] = this.permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Academy {
  int? id;
  String? name;
  String? description;
  String? slogan;
  String? address;
  String? phoneNumber;
  String? email;
  String? contactPerson;
  String? contactPersonMobile;
  String? latitude;
  String? longitude;
  Null? stateId;
  Null? districtId;
  Null? municipalityId;
  Null? paymentChannels;
  Null? extras;
  int? addedBy;
  int? academyTypeId;
  String? academyType;
  String? createdAt;
  String? logo;

  Academy(
      {this.id,
      this.name,
      this.description,
      this.slogan,
      this.address,
      this.phoneNumber,
      this.email,
      this.contactPerson,
      this.contactPersonMobile,
      this.latitude,
      this.longitude,
      this.stateId,
      this.districtId,
      this.municipalityId,
      this.paymentChannels,
      this.extras,
      this.addedBy,
      this.academyTypeId,
      this.academyType,
      this.createdAt,
      this.logo});

  Academy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    slogan = json['slogan'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    contactPerson = json['contact_person'];
    contactPersonMobile = json['contact_person_mobile'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    stateId = json['state_id'];
    districtId = json['district_id'];
    municipalityId = json['municipality_id'];
    paymentChannels = json['payment_channels'];
    extras = json['extras'];
    addedBy = json['added_by'];
    academyTypeId = json['academy_type_id'];
    academyType = json['academy_type'];
    createdAt = json['created_at'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['slogan'] = this.slogan;
    data['address'] = this.address;
    data['phone_number'] = this.phoneNumber;
    data['email'] = this.email;
    data['contact_person'] = this.contactPerson;
    data['contact_person_mobile'] = this.contactPersonMobile;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['state_id'] = this.stateId;
    data['district_id'] = this.districtId;
    data['municipality_id'] = this.municipalityId;
    data['payment_channels'] = this.paymentChannels;
    data['extras'] = this.extras;
    data['added_by'] = this.addedBy;
    data['academy_type_id'] = this.academyTypeId;
    data['academy_type'] = this.academyType;
    data['created_at'] = this.createdAt;
    data['logo'] = this.logo;
    return data;
  }
}

class RoleParsed {
  int? id;
  String? displayName;
  String? name;
  String? guardName;
  List<int>? permissions;

  RoleParsed(
      {this.id, this.displayName, this.name, this.guardName, this.permissions});

  RoleParsed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    name = json['name'];
    guardName = json['guard_name'];
    permissions = json['permissions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    data['name'] = this.name;
    data['guard_name'] = this.guardName;
    data['permissions'] = this.permissions;
    return data;
  }
}

class Permissions {
  int? id;
  int? value;
  String? name;
  String? guardName;
  String? group;
  String? displayName;
  String? label;
  String? createdAt;

  Permissions(
      {this.id,
      this.value,
      this.name,
      this.guardName,
      this.group,
      this.displayName,
      this.label,
      this.createdAt});

  Permissions.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
