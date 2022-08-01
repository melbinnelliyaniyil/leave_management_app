import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_app/bloc/selfcountbloc.dart';
import 'package:leave_management_app/data/models/AllLeaveModel.dart';
import 'package:leave_management_app/data/models/AcceptedLeaveModel.dart';
import 'package:leave_management_app/data/models/EmployeeAllLeaveModel.dart';
import 'package:leave_management_app/data/models/PendingLeaveModel.dart';
import 'package:leave_management_app/data/models/ProfileModel.dart';
import 'package:leave_management_app/data/models/RejectLeaveModel.dart';
import 'package:leave_management_app/data/models/RejectedLeaveModel.dart';
import 'package:leave_management_app/data/models/SelfCountModel.dart';
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

  //////////////rejected leave////////////////////////////

  Future<RejectedLeaveModel> rejectedleave({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final RejectedLeaveModel rejectedLeaveModel = RejectedLeaveModel.fromJson(response);
    return rejectedLeaveModel;
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
  /////////////////////profile//////////////////////////////
  Future<ProfileModel> getprofile({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final ProfileModel profileModel = ProfileModel.fromJson(response);
    return profileModel;
  }

  ///////self count///////////

  Future<SelfCountModel> selfCount({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final SelfCountModel selfCountModel = SelfCountModel.fromJson(response);
    return selfCountModel;
  }

  Future<EmployeeAllLeaveModel> employeeall({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final EmployeeAllLeaveModel employeeAllLeaveModel = EmployeeAllLeaveModel.fromJson(response);
    return employeeAllLeaveModel;
  }
}