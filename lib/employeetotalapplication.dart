import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/bloc/allleavebloc.dart';
import 'package:leave_management_app/bloc/employeeallleavebloc.dart';
import 'package:leave_management_app/helper/tempstorage.dart';

class TotalApplicationEmployee extends StatefulWidget {
  const TotalApplicationEmployee({Key? key}) : super(key: key);

  @override
  State<TotalApplicationEmployee> createState() => _TotalApplicationEmployeeState();
}

class _TotalApplicationEmployeeState extends State<TotalApplicationEmployee> {
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
                itemCount: state.employeeAllLeaveModel.user!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: 20,
                        ),
                        Text("Day Type:${state.employeeAllLeaveModel.user![index].dayType!}"),
                        Text("Leave Type:${state.employeeAllLeaveModel.user![index].leaveType!}"),
                        Text("From:${state.employeeAllLeaveModel.user![index].leaveFrom!}"),
                        Text("To:${state.employeeAllLeaveModel.user![index].leaveTo!}"),
                        Text("REASON:${state.employeeAllLeaveModel.user![index].leaveDesc!}"),
                        Text("STATUS:${state.employeeAllLeaveModel.user![index].leaveStatus!}"),

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
