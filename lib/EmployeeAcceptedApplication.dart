import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/bloc/allleavebloc.dart';
import 'package:leave_management_app/bloc/employeeallleavebloc.dart';
import 'package:leave_management_app/helper/tempstorage.dart';

class EmployeeAcceptedApplication extends StatefulWidget {
  const EmployeeAcceptedApplication({Key? key}) : super(key: key);

  @override
  State<EmployeeAcceptedApplication> createState() => _EmployeeAcceptedApplicationState();
}

class _EmployeeAcceptedApplicationState extends State<EmployeeAcceptedApplication> {
  void initState(){

    super.initState();


    man();
  }
  void man()  {
    var id=  TempStorage.getId();
    return  print("sssssssssss$id");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total"),
      ),
      body: BlocBuilder<EmployeeAllBloc,EmployeeAllState>(
          builder:(context,state){
            if(state is CheckALL){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is AllChecked){
              return ListView.builder(
                itemCount: state.approved.length,
                itemBuilder: (BuildContext context, int index)
                {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 20,
                        ),
                        Text("Day Type:${state.approved[index].dayType!}"),
                        Text("Leave Type:${state.approved[index].leaveType!}"),
                        Text("From:${state.approved[index].leaveFrom!}"),
                        Text("To:${state.approved[index].leaveTo!}"),
                        Text("REASON:${state.approved[index].leaveDesc!}"),
                        Text("STATUS:${state.approved[index].leaveStatus!}"),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                          ],
                        )
                      ],),
                  );
                },
              );
            }
            else if(state is AllError){
              return Center(
                child: Text(state.error),
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }
      ),
    );
  }
}
