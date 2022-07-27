class LeaveCountModel {
  LeaveCountModel({
      this.status, 
      this.msg, 
      this.pendingleave, 
      this.approvedleave, 
      this.rejectedleave, 
      this.totalcount,});

  LeaveCountModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    pendingleave = json['pendingleave'];
    approvedleave = json['approvedleave'];
    rejectedleave = json['rejectedleave'];
    totalcount = json['totalcount'];
  }
  bool? status;
  String? msg;
  int? pendingleave;
  int? approvedleave;
  int? rejectedleave;
  int? totalcount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    map['pendingleave'] = pendingleave;
    map['approvedleave'] = approvedleave;
    map['rejectedleave'] = rejectedleave;
    map['totalcount'] = totalcount;
    return map;
  }

}