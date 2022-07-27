class AddStaffModel {
  AddStaffModel({
      this.status, 
      this.msg, 
      this.user,});

  AddStaffModel.fromJson(dynamic json) {
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
      this.userid, 
      this.role, 
      this.phoneNumber, 
      this.name, 
      this.email, 
      this.gender, 
      this.status, 
      this.designationId, 
      this.id, 
      this.v,});

  User.fromJson(dynamic json) {
    userid = json['userid'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
    designationId = json['designationId'];
    id = json['_id'];
    v = json['__v'];
  }
  String? userid;
  String? role;
  int? phoneNumber;
  String? name;
  String? email;
  String? gender;
  String? status;
  String? designationId;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = userid;
    map['role'] = role;
    map['phoneNumber'] = phoneNumber;
    map['name'] = name;
    map['email'] = email;
    map['gender'] = gender;
    map['status'] = status;
    map['designationId'] = designationId;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}