class ProfileModel {
  bool? status;
  String? msg;
  User? user;

  ProfileModel({this.status, this.msg, this.user});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? role;
  int? phoneNumber;
  String? name;
  String? email;
  String? district;
  String? city;
  String? password;
  String? status;
  int? iV;

  User(
      {this.sId,
        this.role,
        this.phoneNumber,
        this.name,
        this.email,
        this.district,
        this.city,
        this.password,
        this.status,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    email = json['email'];
    district = json['district'];
    city = json['city'];
    password = json['password'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['role'] = this.role;
    data['phoneNumber'] = this.phoneNumber;
    data['name'] = this.name;
    data['email'] = this.email;
    data['district'] = this.district;
    data['city'] = this.city;
    data['password'] = this.password;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}