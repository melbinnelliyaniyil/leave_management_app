import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/loginmodel.dart';
import 'package:leave_management_app/data/repository.dart';
import 'package:leave_management_app/helper/tempstorage.dart';

import '../data/models/LeaveCountModel.dart';




class LeaveCountBloc extends Bloc<LeaveCountEvent, LeaveCountState> {
  LeaveCountBloc() : super(LeaveCountState()) {

    on<CheckCOUNT>(_checkCount);
  }



  Future<FutureOr<void>> _checkCount(
      CheckCOUNT event, Emitter<LeaveCountState> emit) async {
    emit(CheckingCount());
    LeaveCountModel leaveCountModel;

    // print('"body'+body.toString());

    leaveCountModel =
    await Repository().leaveCount(url: '/leave/leavecount',);
    if (leaveCountModel.status == true) {



      emit(CountChecked(leaveCountModel: leaveCountModel));
    } else {
      print(leaveCountModel.msg);
      emit(CountError(error: leaveCountModel.msg.toString()));
    }
  }
}
//events
class LeaveCountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckCOUNT extends LeaveCountEvent {
}


//states

class LeaveCountState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingCount extends LeaveCountState {}
class CountChecked extends LeaveCountState {
  final LeaveCountModel leaveCountModel;
  CountChecked({required this.leaveCountModel});
}

class CountError extends LeaveCountState {
  final String error;
  CountError({required this.error});
}