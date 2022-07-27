import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/models/addstaffmodel.dart';
import 'package:leave_management_app/data/models/loginmodel.dart';
import 'package:leave_management_app/data/repository.dart';
import 'package:leave_management_app/helper/tempstorage.dart';




class AddStaffBloc extends Bloc<AddStaffEvent, AddStaffState> {
  AddStaffBloc() : super(AddStaffState()) {

    on<CheckSTAFF>(_checkStaff);
  }



  Future<FutureOr<void>> _checkStaff(
      CheckSTAFF event, Emitter<AddStaffState> emit) async {
    emit(CheckingStaff());
    AddStaffModel addStaffModel;
    Map body = {
      "name": event.name.toString(),
      "email": event.email.toString(),
      "phoneNumber": event.phoneNumber.toString(),
      "gender": event.gender.toString(),
      "designationId":event.designation_id.toString(),
      "password":event.password.toString()

    };
    // print('"body'+body.toString());

    addStaffModel =
    await Repository().addStaff(url: '/employee/addemployee', data: body);
    if (addStaffModel.status == true) {



      emit(StaffChecked(addStaffModel: addStaffModel));
    } else {
      print(addStaffModel.msg);
      emit(StaffError(error: addStaffModel.msg.toString()));
    }
  }
}
//events
class AddStaffEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckSTAFF extends AddStaffEvent {
  final String name, email,phoneNumber,gender,designation_id,password;
  CheckSTAFF({required this.name, required this.email,required this.phoneNumber,required this.gender,required this.designation_id,required this.password});
}


//states

class AddStaffState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingStaff extends AddStaffState {}
class StaffChecked extends AddStaffState {
  final AddStaffModel addStaffModel;
  StaffChecked({required this.addStaffModel});
}

class StaffError extends AddStaffState {
  final String error;
  StaffError({required this.error});
}