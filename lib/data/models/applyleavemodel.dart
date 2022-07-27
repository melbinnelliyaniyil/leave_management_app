class ApplyLeaveModel {
  ApplyLeaveModel({
      this.status, 
      this.msg, 
      this.user,});

  ApplyLeaveModel.fromJson(dynamic json) {
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
      this.leaveType, 
      this.leaveDesc, 
      this.leaveStatus, 
      this.leaveTo, 
      this.leaveFrom, 
      this.dayType, 
      this.status, 
      this.id, 
      this.v,});

  User.fromJson(dynamic json) {
    leaveType = json['leave_type'];
    leaveDesc = json['leave_desc'];
    leaveStatus = json['leave_status'];
    leaveTo = json['leave_to'];
    leaveFrom = json['leave_from'];
    dayType = json['day_type'];
    status = json['status'];
    id = json['_id'];
    v = json['__v'];
  }
  String? leaveType;
  String? leaveDesc;
  String? leaveStatus;
  String? leaveTo;
  String? leaveFrom;
  String? dayType;
  String? status;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leave_type'] = leaveType;
    map['leave_desc'] = leaveDesc;
    map['leave_status'] = leaveStatus;
    map['leave_to'] = leaveTo;
    map['leave_from'] = leaveFrom;
    map['day_type'] = dayType;
    map['status'] = status;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}