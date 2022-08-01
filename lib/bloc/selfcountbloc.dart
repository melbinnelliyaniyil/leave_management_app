import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/SelfCountModel.dart';
import 'package:leave_management_app/data/models/loginmodel.dart';
import 'package:leave_management_app/data/repository.dart';
import 'package:leave_management_app/helper/tempstorage.dart';






class SelfCountBloc extends Bloc<SelfCountEvent, SelfCountState> {
  SelfCountBloc() : super(SelfCountState()) {

    on<CheckSELFCOUNT>(_checkCount);
  }



  Future<FutureOr<void>> _checkCount(
      CheckSELFCOUNT event, Emitter<SelfCountState> emit) async {
    emit(SelfCountChecking());
    SelfCountModel selfCountModel;

    // print('"body'+body.toString());

    selfCountModel =
    await Repository().selfCount(url: '/leave/leavecountindividually',);
    if (selfCountModel.status == true) {



      emit(SelfCountChecked(selfCountModel: selfCountModel));
    } else {
      print(selfCountModel.msg);
      emit(CountError(error: selfCountModel.msg.toString()));
    }
  }
}
//events
class SelfCountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckSELFCOUNT extends SelfCountEvent {
}


//states

class SelfCountState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelfCountChecking extends SelfCountState {}
class SelfCountChecked extends SelfCountState {
  final SelfCountModel selfCountModel;
  SelfCountChecked({required this.selfCountModel});
}

class CountError extends SelfCountState {
  final String error;
  CountError({required this.error});
}