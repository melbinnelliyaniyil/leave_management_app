import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:leave_management_app/addstaff.dart';
import 'package:leave_management_app/applyleave.dart';

import 'package:leave_management_app/adminhome.dart';
import 'package:leave_management_app/bloc/addstaffbloc.dart';
import 'package:leave_management_app/bloc/applyleavebloc.dart';
import 'package:leave_management_app/bloc/leavecountbloc.dart';
import 'package:leave_management_app/bloc/logbloc.dart';
import 'package:leave_management_app/emphome.dart';
import 'package:leave_management_app/empnavigation.dart';
import 'package:leave_management_app/helper/leaveaccept.dart';
import 'package:leave_management_app/login.dart';
import 'package:leave_management_app/adminnavigation.dart';
import 'package:leave_management_app/login.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context)=> AuthBloc()),
        BlocProvider<AddStaffBloc>(create: (context)=> AddStaffBloc()),
        BlocProvider<ApplyLeaveBloc>(create: (context)=> ApplyLeaveBloc()),
        BlocProvider<LeaveCountBloc>(create: (context)=> LeaveCountBloc())
      ],
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.teal,
            ),
            home: const leaveaccept()
      ),
    );
  }
}
