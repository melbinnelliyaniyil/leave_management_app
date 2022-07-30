import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/loginmodel.dart';
import 'package:leave_management_app/data/repository.dart';
import 'package:leave_management_app/helper/tempstorage.dart';

import '../data/models/approveleavemodel.dart';




class ApproveLeaveBloc extends Bloc<ApproveLeaveEvent, ApproveLeaveState> {
  ApproveLeaveBloc() : super(ApproveLeaveState()) {

    on<CheckAPPROVE>(_checkApprove);
  }



  Future<FutureOr<void>> _checkApprove(
      CheckAPPROVE event, Emitter<ApproveLeaveState> emit) async {
    emit(CheckingApprove(index:event.index));
    ApproveLeaveModel approveLeaveModel;
    Map body = {
      "id":event.id.toString(),
    };
    // print('"body'+body.toString());

    approveLeaveModel =
    await Repository().approveleave(url: '/leave/approveleave', data: body);
    if (approveLeaveModel.status == true) {



      emit(ApproveChecked());
    } else {
      print(approveLeaveModel.msg);
      emit(ApproveError(error: approveLeaveModel.msg.toString()));
    }
  }
}
//events
class ApproveLeaveEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckAPPROVE extends ApproveLeaveEvent {
  final String id,index;
  CheckAPPROVE({required this.id, required this.index });
}


//states

class ApproveLeaveState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingApprove extends ApproveLeaveState {
 final String ?index;
  CheckingApprove({this.index});
}
class ApproveChecked extends ApproveLeaveState {

}

class ApproveError extends ApproveLeaveState {
  final String error;
  ApproveError({required this.error});
}