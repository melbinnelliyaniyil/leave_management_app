import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_app/acceptedLeave.dart';
import 'package:leave_management_app/data/totalApplication.dart';
import 'package:leave_management_app/helper/pendingApplication.dart';
import 'package:leave_management_app/addstaff.dart';
import 'package:leave_management_app/bloc/leavecountbloc.dart';
import 'package:leave_management_app/helper/pendingApplication.dart';
import 'package:leave_management_app/helper/tempstorage.dart';
import 'package:leave_management_app/login.dart';
import 'package:leave_management_app/rejectedLeave.dart';
import 'package:leave_management_app/viewstaff.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  void initState() {
    super.initState();

    BlocProvider.of<LeaveCountBloc>(context).add(CheckCOUNT());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewStaff()));
              },
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
      body: BlocBuilder<LeaveCountBloc, LeaveCountState>(
          builder: (context, state) {
        if (state is CountChecked) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 40.0, right: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PendingApplication()));
                      },
                      child: Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Pending Applications",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    state.leaveCountModel.pendingleave.toString(),
                                    style: TextStyle(fontSize: 27),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 130,
                              ),
                              Icon(Icons.hourglass_bottom_rounded)
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .10,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 0.0, right: 10, bottom: 10),
                  child: InkWell(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TotalApplication()));
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Total Applications",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    state.leaveCountModel.totalcount.toString(),
                                    style: TextStyle(fontSize: 24),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 130,
                              ),
                              Icon(Icons.folder_rounded)
                            ],
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .10,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 0.0, right: 10, bottom: 10),
                  child: InkWell(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AcceptedApplication()));
                      },
                        child: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Accepted Applications",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      state.leaveCountModel.approvedleave!.toString(),
                                      style: TextStyle(fontSize: 27),
                                    )
                                  ],
                                ),
                                Icon(Icons.thumb_up_alt_rounded)
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .10,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 0.0, right: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>RejectedApplication()));},
                      child: Container(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Rejected Applications",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(
                                    state.leaveCountModel.rejectedleave
                                        .toString(),
                                    style: TextStyle(fontSize: 27),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 150,
                              ),
                              Icon(Icons.thumb_down_alt_rounded)
                            ],
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .10,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
        } else if (state is CheckingCount) {
          return CircularProgressIndicator();
        } else {
          return Container(
            child: Text("data"),
          );
        }
      }),
    );
  }
}
