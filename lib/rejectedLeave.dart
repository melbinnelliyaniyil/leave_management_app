import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/bloc/rejectedleavebloc.dart';



class RejectedApplication extends StatefulWidget {
  const RejectedApplication({Key? key}) : super(key: key);

  @override
  State<RejectedApplication> createState() => _RejectedApplicationState();
}

class _RejectedApplicationState extends State<RejectedApplication> {
  void initState(){


    super.initState();

    BlocProvider.of<RejectedLeaveBloc>(context).add(CheckREJECTEDLEAVE());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total"),
      ),
      body: BlocBuilder<RejectedLeaveBloc,RejectedLeaveState>(
          builder:(context,state){
            if(state is CheckREJECTEDLEAVE){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is RejectedLeaveChecked){
              return ListView.builder(
                itemCount: state.rejectedLeaveModel.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("NAME:${state.rejectedLeaveModel.data![index].userid!.name}"),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Day Type:${state.rejectedLeaveModel.data![index].dayType!}"),
                        Text("Leave Type:${state.rejectedLeaveModel.data![index].leaveType!}"),
                        Text("From:${state.rejectedLeaveModel.data![index].leaveFrom!}"),
                        Text("To:${state.rejectedLeaveModel.data![index].leaveTo!}"),
                        Text("REASON:${state.rejectedLeaveModel.data![index].leaveDesc!}"),
                        Text("STATUS:${state.rejectedLeaveModel.data![index].leaveStatus!}"),

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
            else if(state is RejectedLeaveError){
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
