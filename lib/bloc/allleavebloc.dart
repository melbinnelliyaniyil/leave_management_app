import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/AllLeaveModel.dart';
import 'package:leave_management_app/data/models/loginmodel.dart';
import 'package:leave_management_app/data/repository.dart';
import 'package:leave_management_app/helper/tempstorage.dart';






class AllLeaveBloc extends Bloc<AllLeaveEvent, AllLeaveState> {

  AllLeaveBloc() : super(AllLeaveState()) {

    on<CheckALLLEAVE>(_checkAllLeave);
  }





  Future<FutureOr<void>> _checkAllLeave(
      CheckALLLEAVE event, Emitter<AllLeaveState> emit) async {
    emit(CheckingAllLeave());
    AllLeaveModel allLeaveModel;
    List<User> totalind= [];

    // print('"body'+body.toString());

    allLeaveModel =
    await Repository().allLeave(url: '/leave/viewsallleave',);
    totalind = allLeaveModel.user!.where((element) => element.userid?.id == '62dfbc49db380766319765f0').toList();
    totalind.toString();
    print("ssssssssssssssss$totalind");
    if (allLeaveModel.status == true) {
      await TempStorage.addId(allLeaveModel.user.toString());



      emit(AllLeaveChecked(allLeaveModel: allLeaveModel));
    } else {
      print(allLeaveModel.msg);
      emit(AllLeaveError(error: allLeaveModel.msg.toString()));
    }
  }
}


//events
class AllLeaveEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckALLLEAVE extends AllLeaveEvent {
}


//states

class AllLeaveState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingAllLeave extends AllLeaveState {}
class AllLeaveChecked extends AllLeaveState {
  final AllLeaveModel allLeaveModel;
  AllLeaveChecked({required this.allLeaveModel});
}

class AllLeaveError extends AllLeaveState {
  final String error;
  AllLeaveError({required this.error});
}