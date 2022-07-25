import 'package:flutter/material.dart';

class LeaveRequest extends StatefulWidget {
  const LeaveRequest({Key? key}) : super(key: key);

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Leave Request',style: TextStyle(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold,letterSpacing: 1.0),),
      ),
      // body: TabBarView(
      //     children: [
      //       Column(
      //         children: [
      //           Expanded(child:  Lisv),
      //         ],
      //       ),
      //     ],
      // ),
    );
  }
}
