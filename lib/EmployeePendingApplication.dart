import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/bloc/allleavebloc.dart';
import 'package:leave_management_app/bloc/employeeallleavebloc.dart';
import 'package:leave_management_app/helper/tempstorage.dart';

class EmployeePendingApplication extends StatefulWidget {
  const EmployeePendingApplication({Key? key}) : super(key: key);

  @override
  State<EmployeePendingApplication> createState() => _EmployeePendingApplicationState();
}

class _EmployeePendingApplicationState extends State<EmployeePendingApplication> {
  void initState(){

    super.initState();
    BlocProvider.of<EmployeeAllBloc>(context).add(CheckALL());

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
                itemCount: state.pending.length,
                itemBuilder: (BuildContext context, int index)
                {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 20,
                        ),
                        Text("Day Type:${state.pending[index].dayType!}"),
                        Text("Leave Type:${state.pending[index].leaveType!}"),
                        Text("From:${state.pending[index].leaveFrom!}"),
                        Text("To:${state.pending[index].leaveTo!}"),
                        Text("REASON:${state.pending[index].leaveDesc!}"),
                        Text("STATUS:${state.pending[index].leaveStatus!}"),

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
