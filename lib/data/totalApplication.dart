import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/bloc/allleavebloc.dart';

class TotalApplication extends StatefulWidget {
  const TotalApplication({Key? key}) : super(key: key);

  @override
  State<TotalApplication> createState() => _TotalApplicationState();
}

class _TotalApplicationState extends State<TotalApplication> {
  void initState(){


    super.initState();

    BlocProvider.of<AllLeaveBloc>(context).add(CheckALLLEAVE());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total"),
      ),
      body: BlocBuilder<AllLeaveBloc,AllLeaveState>(
        builder:(context,state){
          if(state is CheckALLLEAVE){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is AllLeaveChecked){
            return ListView.builder(
              itemCount: state.allLeaveModel.user!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("NAME:${state.allLeaveModel.user![index].userid!.name}"),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Day Type:${state.allLeaveModel.user![index].dayType!}"),
                      Text("Leave Type:${state.allLeaveModel.user![index].leaveType!}"),
                      Text("From:${state.allLeaveModel.user![index].leaveFrom!}"),
                      Text("To:${state.allLeaveModel.user![index].leaveTo!}"),
                      Text("REASON:${state.allLeaveModel.user![index].leaveDesc!}"),
                      Text("STATUS:${state.allLeaveModel.user![index].leaveStatus!}"),

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
          else if(state is AllLeaveError){
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
