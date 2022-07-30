import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/PendingLeaveModel.dart';
import 'package:leave_management_app/data/repository.dart';

class PendingLeaveBloc extends Bloc<PendingLeaveEvent, PendingLeaveState> {
  PendingLeaveBloc() : super(PendingLeaveState()) {

    on<CheckPENDINGLEAVE>(_checkPendingLeave);
  }



  Future<FutureOr<void>> _checkPendingLeave(
      CheckPENDINGLEAVE event, Emitter<PendingLeaveState> emit) async {
    emit(CheckingPendingLeave());
    PendingLeaveModel pendingLeaveModel;

    // print('"body'+body.toString());

    pendingLeaveModel =
    await Repository().pendingLeave(url: '/leave/viewleavestatuspending',);
    if (pendingLeaveModel.status == true) {



      emit(PendingLeaveChecked(leavePendingLeaveModel: pendingLeaveModel));
    } else {
      print(pendingLeaveModel.msg);
      emit(PendingLeaveError(error: pendingLeaveModel.msg.toString()));
    }
  }
}
//events
class PendingLeaveEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckPENDINGLEAVE extends PendingLeaveEvent {
}


//states

class PendingLeaveState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingPendingLeave extends PendingLeaveState {}
class PendingLeaveChecked extends PendingLeaveState {
  final PendingLeaveModel leavePendingLeaveModel;
  PendingLeaveChecked({required this.leavePendingLeaveModel});
}

class PendingLeaveError extends PendingLeaveState {
  final String error;
  PendingLeaveError({required this.error});
}