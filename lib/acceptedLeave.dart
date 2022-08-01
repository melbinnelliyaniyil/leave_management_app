import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/bloc/acceptedleavebloc.dart';

class AcceptedApplication extends StatefulWidget {
  const AcceptedApplication({Key? key}) : super(key: key);

  @override
  State<AcceptedApplication> createState() => _AcceptedApplicationState();
}

class _AcceptedApplicationState extends State<AcceptedApplication> {
  void initState() {
    super.initState();

    BlocProvider.of<AcceptedLeaveBloc>(context).add(CheckACCEPTEDLEAVE());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accepted"),
      ),
      body: BlocBuilder<AcceptedLeaveBloc, AcceptedLeaveState>(
          builder: (context, state) {
        if (state is CheckACCEPTEDLEAVE) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AcceptedLeaveChecked) {
          return ListView.builder(
            itemCount: state.acceptedLeaveModel.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "NAME:${state.acceptedLeaveModel.data![index].userid!.name}"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Day Type:${state.acceptedLeaveModel.data![index].dayType!}"),
                    Text(
                        "Leave Type:${state.acceptedLeaveModel.data![index].leaveType!}"),
                    Text(
                        "From:${state.acceptedLeaveModel.data![index].leaveFrom!}"),
                    Text(
                        "To:${state.acceptedLeaveModel.data![index].leaveTo!}"),
                    Text(
                        "REASON:${state.acceptedLeaveModel.data![index].leaveDesc!}"),
                    Text(
                        "STATUS:${state.acceptedLeaveModel.data![index].leaveStatus!}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [],
                    )
                  ],
                ),
              );
            },
          );
        } else if (state is AcceptedLeaveError) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
