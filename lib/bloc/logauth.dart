import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/data/repository.dart';
import 'package:leave_management_app/data/models/loginmodel.dart';
import 'package:leave_management_app/helper/tempstorage.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {

    on<CheckOTP>(_checkOtp);
  }



  Future<FutureOr<void>> _checkOtp(
      CheckOTP event, Emitter<AuthState> emit) async {
    emit(CheckingOtp());
    LoginModel loginModel;
    Map body = {
      "email": event.phone.toString(),
      "password": event.otpNumber.toString(),
    };
    print('"body'+body.toString());

    loginModel =
    await Repository().login(url: '/user/login', data: body);
    if (loginModel.status == true) {
      await TempStorage.addToken(loginModel.token.toString());


      emit(OtpChecked(role: loginModel.data!.role!));
    } else {
      print(loginModel.msg);
      emit(OtpError(error: loginModel.msg.toString()));
    }
  }
}
//events
class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckOTP extends AuthEvent {
  final String otpNumber, phone;
  CheckOTP({required this.otpNumber, required this.phone});
}


//states

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingOtp extends AuthState {}
class OtpChecked extends AuthState {
  final String role;
  OtpChecked({required this.role});
}

class OtpError extends AuthState {
  final String error;
  OtpError({required this.error});
}