import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_app/addstaff.dart';
import 'package:leave_management_app/bloc/allleavebloc.dart';
import 'package:leave_management_app/helper/tempstorage.dart';
import 'package:leave_management_app/login.dart';

class leaveaccept extends StatefulWidget {
  const leaveaccept({Key? key}) : super(key: key);

  @override
  State<leaveaccept> createState() => _leaveacceptState();
}

class _leaveacceptState extends State<leaveaccept> {
  void initState(){


    super.initState();

    BlocProvider.of<AllLeaveBloc>(context).add(CheckALLLEAVE(
    ));
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
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStaff()));},
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
                        (Route<dynamic> route)=> false);
                Fluttertoast.showToast(msg: "Logged Out");
              },
            ),
          ],
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder( shrinkWrap:true,itemCount: 5,itemBuilder: (BuildContext context, int index){
              return Card(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("NAME:"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("REASON:"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton( color: Colors.green,onPressed: (){},
                      child: Text("ACCEPT"),),
                      SizedBox(
                        width: 20,
                      ),
                      MaterialButton(color: Colors.red,onPressed: (){},
                      child: Text("REJECT"),)
                    ],
                  )
                  ],),
              );

            })
          ],
        ),
      ),
    );
  }
}
