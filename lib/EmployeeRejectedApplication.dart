import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/bloc/allleavebloc.dart';
import 'package:leave_management_app/bloc/employeeallleavebloc.dart';
import 'package:leave_management_app/helper/tempstorage.dart';

class EmployeeRejectedApplication extends StatefulWidget {
  const EmployeeRejectedApplication({Key? key}) : super(key: key);

  @override
  State<EmployeeRejectedApplication> createState() => _EmployeeRejectedApplicationState();
}

class _EmployeeRejectedApplicationState extends State<EmployeeRejectedApplication> {
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
                itemCount: state.rejected.length,
                itemBuilder: (BuildContext context, int index)
                {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 20,
                        ),
                        Text("Day Type:${state.rejected[index].dayType!}"),
                        Text("Leave Type:${state.rejected[index].leaveType!}"),
                        Text("From:${state.rejected[index].leaveFrom!}"),
                        Text("To:${state.rejected[index].leaveTo!}"),
                        Text("REASON:${state.rejected[index].leaveDesc!}"),
                        Text("STATUS:${state.rejected[index].leaveStatus!}"),

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
