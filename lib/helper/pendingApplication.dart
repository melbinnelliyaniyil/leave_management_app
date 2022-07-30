import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_app/addstaff.dart';
import 'package:leave_management_app/bloc/approveleavebloc.dart';
import 'package:leave_management_app/bloc/pendingleavebloc.dart';
import 'package:leave_management_app/bloc/rejectleavebloc.dart';
import 'package:leave_management_app/data/models/approveleavemodel.dart';
import 'package:leave_management_app/helper/tempstorage.dart';

import 'package:leave_management_app/login.dart';

class PendingApplication extends StatefulWidget {
  const PendingApplication({Key? key}) : super(key: key);

  @override
  State<PendingApplication> createState() => _PendingApplicationState();
}

class _PendingApplicationState extends State<PendingApplication> {
  void initState() {
    super.initState();

    BlocProvider.of<PendingLeaveBloc>(context).add(CheckPENDINGLEAVE());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PENDING LEAVES"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              ListTile(
                title: const Text('Add Staff'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddStaff()));
                },
              ),
              ListTile(
                title: const Text('Edit Staff'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Log Out'),
                onTap: () {
                  print(TempStorage.getToken());
                  //TempStorage.clearToken();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false);
                  Fluttertoast.showToast(msg: "Logged Out");
                },
              ),
            ],
          ),
        ),
        body: BlocBuilder<PendingLeaveBloc, PendingLeaveState>(
            builder: (context, state) {
          if (state is PendingLeaveChecked) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.leavePendingLeaveModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "NAME:${state.leavePendingLeaveModel.data![index].userid!.name!}"),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  "Day Type:${state.leavePendingLeaveModel.data![index].dayType}"),
                              Text(
                                  "Leave Type:${state.leavePendingLeaveModel.data![index].leaveType}"),
                              Text(
                                  "From:${state.leavePendingLeaveModel.data![index].leaveFrom}"),
                              Text(
                                  "To:${state.leavePendingLeaveModel.data![index].leaveTo}"),
                              Text(
                                  "REASON:${state.leavePendingLeaveModel.data![index].leaveDesc}"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                    color: Colors.green,
                                    onPressed: () {
                                      BlocProvider.of<ApproveLeaveBloc>(context)
                                          .add(CheckAPPROVE(
                                        id: state.leavePendingLeaveModel
                                            .data![index].id
                                            .toString(),index: index.toString()
                                      ));
                                    },
                                    child: BlocConsumer<ApproveLeaveBloc,
                                        ApproveLeaveState>(
                                      builder: (context, state) {
                                        if (state is CheckingApprove&&state.index==index.toString()) {
                                          return Container(
                                            height: 22,
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return Text(
                                            "APPROVE",
                                            style: TextStyle(fontSize: 14),
                                          );
                                        }
                                      },
                                      listener: (context, state) {
                                        if (state is ApproveChecked) {
                                      //    RefreshIndicatorState();
                                          Fluttertoast.showToast(
                                              msg: "Approved");

                                          BlocProvider.of<PendingLeaveBloc>(
                                                  context)
                                              .add(CheckPENDINGLEAVE());
                                        } else if (state is ApproveError) {
                                          Fluttertoast.showToast(
                                            msg: state.error,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  MaterialButton(
                                    color: Colors.red,
                                    onPressed: () {
                                      BlocProvider.of<RejectLeaveBloc>(context)
                                          .add(CheckREJECT(
                                          id: state.leavePendingLeaveModel
                                              .data![index].id
                                              .toString(),index: index.toString()
                                      ));
                                    },
                                    child: BlocConsumer<RejectLeaveBloc,
                                        RejectLeaveState>(
                                      builder: (context, state) {
                                        if (state is CheckingReject&&state.index==index.toString()) {
                                          return Container(
                                            height: 22,
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return Text(
                                            "REJECT",
                                            style: TextStyle(fontSize: 14),
                                          );
                                        }
                                      },
                                      listener: (context, state) {
                                        if (state is RejectChecked) {
                                          //    RefreshIndicatorState();
                                          Fluttertoast.showToast(
                                              msg: "Rejected");

                                          BlocProvider.of<PendingLeaveBloc>(
                                              context)
                                              .add(CheckPENDINGLEAVE());
                                        } else if (state is RejectError) {
                                          Fluttertoast.showToast(
                                            msg: state.error,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
            );
          } else if (state is CheckingPendingLeave) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        }));
  }
}
