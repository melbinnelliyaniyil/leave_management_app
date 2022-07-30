import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/applyleavemodel.dart';

import 'package:leave_management_app/data/models/loginmodel.dart';
import 'package:leave_management_app/data/repository.dart';
import 'package:leave_management_app/helper/tempstorage.dart';




class ApplyLeaveBloc extends Bloc<ApplyLeaveEvent, ApplyLeaveState> {
  ApplyLeaveBloc() : super(ApplyLeaveState()) {

    on<CheckLEAVE>(_checkLeave);
  }



  Future<FutureOr<void>> _checkLeave(
      CheckLEAVE event, Emitter<ApplyLeaveState> emit) async {
    emit(CheckingLeave());
    ApplyLeaveModel applyLeaveModel;
    Map body = {
      "leave_type": event.leave_type.toString(),
      "leave_desc": event.leave_desc.toString(),
      "leave_to": event.leave_to.toString(),
      "leave_from": event.leave_from.toString(),
      "day_type":event.day_type.toString()

    };
    // print('"body'+body.toString());

    applyLeaveModel =
    await Repository().applyLeave(url: '/leave/applyleave', data: body);
    if (applyLeaveModel.status == true) {



      emit(LeaveChecked(applyLeaveModel: applyLeaveModel));
    } else {
      print(applyLeaveModel.msg);
      emit(LeaveError(error: applyLeaveModel.msg.toString()));
    }
  }
}
//events
class ApplyLeaveEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class
CheckLEAVE extends ApplyLeaveEvent {
  final String leave_type, leave_desc,leave_to,leave_from,day_type;
  CheckLEAVE({required this.leave_type, required this.leave_desc,required this.leave_to,required this.leave_from,required this.day_type});
}


//states

class ApplyLeaveState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingLeave extends ApplyLeaveState {}
class LeaveChecked extends ApplyLeaveState {
  final ApplyLeaveModel applyLeaveModel;
  LeaveChecked({required this.applyLeaveModel});
}

class LeaveError extends ApplyLeaveState {
  final String error;
  LeaveError({required this.error});
}