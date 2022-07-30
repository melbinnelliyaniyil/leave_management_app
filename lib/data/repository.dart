import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_app/data/models/AllLeaveModel.dart';
import 'package:leave_management_app/data/models/AcceptedLeaveModel.dart';
import 'package:leave_management_app/data/models/PendingLeaveModel.dart';
import 'package:leave_management_app/data/models/RejectLeaveModel.dart';
import 'package:leave_management_app/data/models/addstaffmodel.dart';
import 'package:leave_management_app/data/models/applyleavemodel.dart';
import 'package:leave_management_app/data/models/loginmodel.dart';

import 'package:leave_management_app/data/webclient.dart';

import 'models/LeaveCountModel.dart';
import 'models/approveleavemodel.dart';


class Repository{
  Future<LoginModel> login({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final LoginModel loginModel = LoginModel.fromJson(response);
    return loginModel;
  }

  Future<AddStaffModel> addStaff({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final AddStaffModel addStaffModel = AddStaffModel.fromJson(response);
    return addStaffModel;
  }

  Future<ApplyLeaveModel> applyLeave({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final ApplyLeaveModel applyLeaveModel = ApplyLeaveModel.fromJson(response);
    return applyLeaveModel;
  }
  Future<LeaveCountModel> leaveCount({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final LeaveCountModel leaveCountModel = LeaveCountModel.fromJson(response);
    return leaveCountModel;
  }


  Future<AllLeaveModel> allLeave({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final AllLeaveModel allLeaveModel = AllLeaveModel.fromJson(response);
    return allLeaveModel;
  }
  Future<PendingLeaveModel> pendingLeave({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final PendingLeaveModel pendingLeaveModel = PendingLeaveModel.fromJson(response);
    return pendingLeaveModel;
  }

  //////////////accepted leave////////////////////////////

  Future<AcceptedLeaveModel> acceptedleave({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final AcceptedLeaveModel acceptedLeaveModel = AcceptedLeaveModel.fromJson(response);
    return acceptedLeaveModel;
  }

////////
  Future<ApproveLeaveModel> approveleave({required String url,dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url,data);
    final ApproveLeaveModel approveLeaveModel = ApproveLeaveModel.fromJson(response);
    return approveLeaveModel;
  }
///////////////////////Reject leave /////////////////////////////////////////////////////////
  Future<RejectLeaveModel> rejectleave({required String url,dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url,data);
    final RejectLeaveModel rejectLeaveModel = RejectLeaveModel.fromJson(response);
    return rejectLeaveModel;
  }
}