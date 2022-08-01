import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_app/EmployeeAcceptedApplication.dart';
import 'package:leave_management_app/EmployeePendingApplication.dart';
import 'package:leave_management_app/EmployeeRejectedApplication.dart';

import 'package:leave_management_app/applyleave.dart';
import 'package:leave_management_app/bloc/leavecountbloc.dart';
import 'package:leave_management_app/bloc/selfcountbloc.dart';
import 'package:leave_management_app/helper/tempstorage.dart';


import 'employeetotalapplication.dart';
import 'login.dart';

class EmpHome extends StatefulWidget {
  const EmpHome({Key? key}) : super(key: key);

  @override
  _EmpHomeState createState() => _EmpHomeState();
}

class _EmpHomeState extends State<EmpHome> {
  void initState() {
    super.initState();

    BlocProvider.of<SelfCountBloc>(context).add(CheckSELFCOUNT());
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
              title: const Text('Apply Leave'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ApplyLeave()));
              },
            ),
            ListTile(
              title: const Text('Leave Status'),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ()));
              },
            ),

            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                print(TempStorage.getToken());
                TempStorage.clearToken();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                        (Route<dynamic> route)=> false);
                Fluttertoast.showToast(msg: "Logged Out");
              },
            ),
          ],
        ),
      ),
      body:
      BlocBuilder<SelfCountBloc, SelfCountState>(
          builder: (context, state) {
            if (state is SelfCountChecked) {
              return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 40.0, right: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => Accept()));
                },

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell( onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TotalApplicationEmployee()));},
                    child: Container(
                      child: Center(
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
                                  height: 20,
                                ),
                                Text(
                                  "Total leaves       ",
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text(
                                  state.selfCountModel.totalcount.toString(),
                                  style: TextStyle(fontSize: 27),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 180,
                            ),
                            Icon(Icons.folder_rounded)
                          ],
                        ),
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
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Accept()));
                },

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeAcceptedApplication()));},
                    child: Container(
                      child: Center(
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
                                  height: 20,
                                ),
                                Text(
                                  "Accepted          ",
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text(
                                  state.selfCountModel.approvedleave!.toString(),
                                  style: TextStyle(fontSize: 27),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 180,
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
                child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeeRejectedApplication()));},
                  child: Container(
                    child: Center(

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
                                height: 20,
                              ),
                              Text(
                                "Rejected            ",
                                style: TextStyle(fontSize: 17),
                              ),
                              Text(
                                state.selfCountModel.rejectedleave
                                    .toString(),                              style: TextStyle(fontSize: 27),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 180,
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 0.0, right: 10, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: InkWell(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>EmployeePendingApplication()));},
                  child: Container(
                    child: Center(
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
                                height: 20,
                              ),
                              Text(
                                "Pending             ",
                                style: TextStyle(fontSize: 17),
                              ),
                              Text(
                                state.selfCountModel.pendingleave.toString(),
                                style: TextStyle(fontSize: 27),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 180,
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
          ],
        ),
      );
  } else if (state is SelfCountChecking) {
  return Center(child: CircularProgressIndicator());
  } else {
  return Container(
  child: Text("data"),
  );
  }
}),

    );
  }
}
