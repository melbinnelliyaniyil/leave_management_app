class AcceptedLeaveModel {
  bool? status;
  String? msg;
  List<Data>? data;
  int? length;

  AcceptedLeaveModel({this.status, this.msg, this.data, this.length});

  AcceptedLeaveModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['length'] = this.length;
    return data;
  }
}

class Data {
  String? sId;
  Userid? userid;
  String? leaveType;
  String? leaveDesc;
  String? leaveStatus;
  String? leaveTo;
  String? leaveFrom;
  String? dayType;
  String? status;
  int? iV;

  Data(
      {this.sId,
        this.userid,
        this.leaveType,
        this.leaveDesc,
        this.leaveStatus,
        this.leaveTo,
        this.leaveFrom,
        this.dayType,
        this.status,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userid =
    json['userid'] != null ? new Userid.fromJson(json['userid']) : null;
    leaveType = json['leave_type'];
    leaveDesc = json['leave_desc'];
    leaveStatus = json['leave_status'];
    leaveTo = json['leave_to'];
    leaveFrom = json['leave_from'];
    dayType = json['day_type'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.userid != null) {
      data['userid'] = this.userid!.toJson();
    }
    data['leave_type'] = this.leaveType;
    data['leave_desc'] = this.leaveDesc;
    data['leave_status'] = this.leaveStatus;
    data['leave_to'] = this.leaveTo;
    data['leave_from'] = this.leaveFrom;
    data['day_type'] = this.dayType;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}

class Userid {
  String? sId;
  String? role;
  int? phoneNumber;
  String? name;
  String? email;
  String? password;
  String? designationId;
  String? designationName;
  String? status;
  int? iV;

  Userid(
      {this.sId,
        this.role,
        this.phoneNumber,
        this.name,
        this.email,
        this.password,
        this.designationId,
        this.designationName,
        this.status,
        this.iV});

  Userid.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    designationId = json['designationId'];
    designationName = json['designationName'];
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
    data['password'] = this.password;
    data['designationId'] = this.designationId;
    data['designationName'] = this.designationName;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}