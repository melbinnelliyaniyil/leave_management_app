class RejectedLeaveModel {
  RejectedLeaveModel({
      this.status, 
      this.msg, 
      this.data, 
      this.length,});

  RejectedLeaveModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    length = json['length'];
  }
  bool? status;
  String? msg;
  List<Data>? data;
  int? length;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['length'] = length;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.userid, 
      this.leaveType, 
      this.leaveDesc, 
      this.leaveStatus, 
      this.leaveTo, 
      this.leaveFrom, 
      this.dayType, 
      this.status, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    userid = json['userid'] != null ? Userid.fromJson(json['userid']) : null;
    leaveType = json['leave_type'];
    leaveDesc = json['leave_desc'];
    leaveStatus = json['leave_status'];
    leaveTo = json['leave_to'];
    leaveFrom = json['leave_from'];
    dayType = json['day_type'];
    status = json['status'];
    v = json['__v'];
  }
  String? id;
  Userid? userid;
  String? leaveType;
  String? leaveDesc;
  String? leaveStatus;
  String? leaveTo;
  String? leaveFrom;
  String? dayType;
  String? status;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (userid != null) {
      map['userid'] = userid?.toJson();
    }
    map['leave_type'] = leaveType;
    map['leave_desc'] = leaveDesc;
    map['leave_status'] = leaveStatus;
    map['leave_to'] = leaveTo;
    map['leave_from'] = leaveFrom;
    map['day_type'] = dayType;
    map['status'] = status;
    map['__v'] = v;
    return map;
  }

}

class Userid {
  Userid({
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

  Userid.fromJson(dynamic json) {
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