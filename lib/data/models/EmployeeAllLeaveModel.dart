class EmployeeAllLeaveModel {
  EmployeeAllLeaveModel({
      this.status, 
      this.msg, 
      this.user,});

  EmployeeAllLeaveModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['user'] != null) {
      user = [];
      json['user'].forEach((v) {
        user?.add(User.fromJson(v));
      });
    }
  }
  bool? status;
  String? msg;
  List<User>? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (user != null) {
      map['user'] = user?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class User {
  User({
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

  User.fromJson(dynamic json) {
    id = json['_id'];
    userid = json['userid'];
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
  String? userid;
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
    map['userid'] = userid;
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