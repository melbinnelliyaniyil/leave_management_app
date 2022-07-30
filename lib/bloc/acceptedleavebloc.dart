import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/ApproveLeaveModel.dart';
import 'package:leave_management_app/data/models/AcceptedLeaveModel.dart';
import 'package:leave_management_app/data/repository.dart';



class AcceptedLeaveBloc extends Bloc<AcceptedLeaveEvent, AcceptedLeaveState> {
  AcceptedLeaveBloc() : super(AcceptedLeaveState()) {

    on<CheckACCEPTEDLEAVE>(_checkAcceptedLeave);
  }



  Future<FutureOr<void>> _checkAcceptedLeave(
      CheckACCEPTEDLEAVE event, Emitter<AcceptedLeaveState> emit) async {
    emit(CheckingAcceptedLeave());
    AcceptedLeaveModel acceptedLeaveModel;

    // print('"body'+body.toString());

    acceptedLeaveModel =
    await Repository().acceptedleave(url: '/leave/viewleavestatusapproved',);
    if (acceptedLeaveModel.status == true) {



      emit(AcceptedLeaveChecked(acceptedLeaveModel: acceptedLeaveModel));
    } else {
      print(acceptedLeaveModel.msg);
      emit(AcceptedLeaveError(error: acceptedLeaveModel.msg.toString()));
    }
  }
}
//events
class AcceptedLeaveEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckACCEPTEDLEAVE extends AcceptedLeaveEvent {
}


//states

class AcceptedLeaveState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAcceptedLeave extends AcceptedLeaveState {}
class AcceptedLeaveChecked extends AcceptedLeaveState {
  final AcceptedLeaveModel acceptedLeaveModel;
  AcceptedLeaveChecked({required this.acceptedLeaveModel});
}

class AcceptedLeaveError extends AcceptedLeaveState {
  final String error;
  AcceptedLeaveError({required this.error});
}