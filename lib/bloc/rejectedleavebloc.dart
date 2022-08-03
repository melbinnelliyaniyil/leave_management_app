import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/ApproveLeaveModel.dart';
import 'package:leave_management_app/data/models/RejectedLeaveModel.dart';
import 'package:leave_management_app/data/repository.dart';



class RejectedLeaveBloc extends Bloc<RejectedLeaveEvent, RejectedLeaveState> {
  RejectedLeaveBloc() : super(RejectedLeaveState()) {

    on<CheckREJECTEDLEAVE>(_checkRejectedLeave);
  }



  Future<FutureOr<void>> _checkRejectedLeave(
      CheckREJECTEDLEAVE event, Emitter<RejectedLeaveState> emit) async {
    emit(CheckingRejectedLeave());
    RejectedLeaveModel rejectedLeaveModel;

    // print('"body'+body.toString());

    rejectedLeaveModel =
    await Repository().rejectedleave(url: '/leave/viewleavestatusrejectedd',);
    if (rejectedLeaveModel.status == true) {



      emit(RejectedLeaveChecked(rejectedLeaveModel: rejectedLeaveModel));
    } else {
      print(rejectedLeaveModel.msg);
      emit(RejectedLeaveError(error: rejectedLeaveModel.msg.toString()));
    }
  }
}
//events
class RejectedLeaveEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckREJECTEDLEAVE extends RejectedLeaveEvent {
}


//states

class RejectedLeaveState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingRejectedLeave extends RejectedLeaveState {}
class RejectedLeaveChecked extends RejectedLeaveState {
  final RejectedLeaveModel rejectedLeaveModel;
  RejectedLeaveChecked({required this.rejectedLeaveModel});
}

class RejectedLeaveError extends RejectedLeaveState {
  final String error;
  RejectedLeaveError({required this.error});
}