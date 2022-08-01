import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/loginmodel.dart';
import 'package:leave_management_app/data/repository.dart';
import 'package:leave_management_app/helper/tempstorage.dart';

import '../data/models/EmployeeAllLeaveModel.dart';
import '../data/models/approveleavemodel.dart';

class EmployeeAllBloc extends Bloc<EmployeeAllEvent, EmployeeAllState> {
  EmployeeAllBloc() : super(EmployeeAllState()) {
    on<CheckALL>(_checkAll);
  }

  Future<FutureOr<void>> _checkAll(
      CheckALL event, Emitter<EmployeeAllState> emit) async {
    emit(CheckingAll());
    List<User> approved = [];
    List<User> rejected = [];
    List<User> pending = [];
    EmployeeAllLeaveModel employeeAllLeaveModel;
    EmployeeAllLeaveModel approvedModel, rejectedModel, pendingModel;

///approved
    approvedModel = await Repository().employeeall(
        url: '/leave/employeeviewsallleave',
       );
    ///rejected
    rejectedModel = await Repository().employeeall(
        url: '/leave/employeeviewsallleave',
       );
    ///pending
    pendingModel = await Repository().employeeall(
        url: '/leave/employeeviewsallleave',
        );
    employeeAllLeaveModel = await Repository()
        .employeeall(url: '/leave/employeeviewsallleave');

    approved = approvedModel.user!
        .where((element) => element.leaveStatus == 'approved')
        .toList();
    rejected = rejectedModel.user!
        .where((element) => element.leaveStatus == 'rejected')
        .toList();
    pending = pendingModel.user!
        .where((element) => element.leaveStatus == 'pending')
        .toList();

    for(int i = 0; i<approved.length; i++){
         print(approved[i].leaveType);
       }
    if (employeeAllLeaveModel.status == true) {
      emit(AllChecked(employeeAllLeaveModel: employeeAllLeaveModel,approved: approved,rejected: rejected,pending: pending));
    } else {
      print(employeeAllLeaveModel.msg);
      emit(AllError(error: employeeAllLeaveModel.msg.toString()));
    }
  }
}

//events
class EmployeeAllEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckALL extends EmployeeAllEvent {

}

//states

class EmployeeAllState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAll extends EmployeeAllState {
  CheckingAll();
}

class AllChecked extends EmployeeAllState {
  final EmployeeAllLeaveModel employeeAllLeaveModel;
  final List<User> approved,rejected,pending;
  AllChecked({required this.employeeAllLeaveModel,required this.approved,required this.rejected,required this.pending});
}

class AllError extends EmployeeAllState {
  final String error;
  AllError({required this.error});
}
