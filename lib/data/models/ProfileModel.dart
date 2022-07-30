class ProfileModel {
  ProfileModel({
      this.status, 
      this.msg, 
      this.user,});

  ProfileModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  bool? status;
  String? msg;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.role, 
      this.phoneNumber, 
      this.name, 
      this.email, 
      this.password, 
      this.designationId, 
      this.designationName, 
      this.status, 
      this.v,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    designationId = json['designationId'];
    designationName = json['designationName'];
    status = json['status'];
    v = json['__v'];
  }
  String? id;
  String? role;
  int? phoneNumber;
  String? name;
  String? email;
  String? password;
  String? designationId;
  String? designationName;
  String? status;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['role'] = role;
    map['phoneNumber'] = phoneNumber;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['designationId'] = designationId;
    map['designationName'] = designationName;
    map['status'] = status;
    map['__v'] = v;
    return map;
  }

}