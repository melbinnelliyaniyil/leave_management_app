import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/loginmodel.dart';
import 'package:leave_management_app/data/repository.dart';
import 'package:leave_management_app/helper/tempstorage.dart';

import '../data/models/RejectLeaveModel.dart';
import '../data/models/approveleavemodel.dart';




class RejectLeaveBloc extends Bloc<RejectLeaveEvent, RejectLeaveState> {
  RejectLeaveBloc() : super(RejectLeaveState()) {

    on<CheckREJECT>(_checkReject);
  }



  Future<FutureOr<void>> _checkReject(
      CheckREJECT event, Emitter<RejectLeaveState> emit) async {
    emit(CheckingReject(index:event.index));

    RejectLeaveModel rejectLeaveModel;
    Map body = {
      "id":event.id.toString(),
    };
    // print('"body'+body.toString());

    rejectLeaveModel =
    await Repository().rejectleave(url: '/leave/rejectleave', data: body);
    if (rejectLeaveModel.status == true) {



      emit(RejectChecked());
    } else {
      print(rejectLeaveModel.msg);
      emit(RejectError(error: rejectLeaveModel.msg.toString()));
    }
  }
}
//events
class RejectLeaveEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckREJECT extends RejectLeaveEvent {
  final String id,index;
  CheckREJECT({required this.id, required this.index });
}


//states

class RejectLeaveState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingReject extends RejectLeaveState {
  final String ?index;
  CheckingReject({this.index});
}
class RejectChecked extends RejectLeaveState {

}

class RejectError extends RejectLeaveState {
  final String error;
  RejectError({required this.error});
}