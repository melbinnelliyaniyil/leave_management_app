import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_app/bloc/applyleavebloc.dart';
import 'package:leave_management_app/emphome.dart';

import 'empnavigation.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}
enum SingingCharacter { Male, Female }

SingingCharacter? _character = SingingCharacter.Male;


class _ApplyLeaveState extends State<ApplyLeave> {
  int _value = 1;
  List items = ['Casual leave', 'Sick leave', 'Duty leave'];
  List dayType=['Full Day','First Half','Second Half'];
  String? selectedItem = 'Casual leave';
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2022, 6, 01), end: DateTime(2030, 12, 31));
  var reason=TextEditingController();

  String? gender;
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;

    return Scaffold(
      appBar: AppBar(
        title: Text("Leave Application"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Leave Type",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: DropdownButton(
                  value: selectedItem,

                  items: items
                      .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,

                          )
                  ))
                      .toList(),
                  onChanged: (item){
                      setState(() => selectedItem = item as String?);
                      print(item);
                  },
                ),
              ),
              Text(
                "Day Type",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),

              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value as int;
                        _value--;
                        print(dayType[_value]);
                      });
                    },
                  ),
                  SizedBox(width: 10.0),
                  Text("Full Day"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value as int;
                        _value--;
                        print(dayType[_value]);
                      });
                    },
                  ),
                  SizedBox(width: 10.0),
                  Text("First Half"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value as int;
                        _value--;
                        print(dayType[_value]);
                      });
                    },
                  ),
                  SizedBox(width: 10.0),
                  Text("Second Half"),
                ],
              ),
              Text(
                "Select Date",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      child: Text('${start.day}/${start.month}/${start.year}'),
                      onPressed: pickDateRange,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      child: Text('${end.day}/${end.month}/${end.year}'),
                      onPressed: pickDateRange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Text('No of days selected:${difference.inDays}days',
              //   style: TextStyle(fontSize: 19),
              // ),
              Text("Reason",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: reason,
                style: TextStyle(),
                obscureText: false,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,

                    hintText: "Reason",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              Center(
                child: SizedBox(
                  height: 90,

                  child: Row(
                    children: [
                      MaterialButton(onPressed: (){
                        BlocProvider.of<ApplyLeaveBloc>(context).add(CheckLEAVE(
                            leave_desc: reason.text,
                          leave_from: dateRange.start.toString(),
                          leave_to: dateRange.end.toString(),
                          day_type: dayType[_value],
                          leave_type: items.toString()
                        )
                        );
                      }
                          ,child: BlocConsumer<ApplyLeaveBloc, ApplyLeaveState>(
                          builder: (context, state) {
                            if (state is CheckingLeave) {
                              return Container(
                                height: 22,
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Text(
                                "Submit",
                                style: TextStyle(fontSize: 14),
                              );
                            }
                          },
                          listener: (context, state) {
                            if (state is LeaveChecked) {
                              Fluttertoast.showToast(msg: state.applyLeaveModel.status.toString());
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EmpNavigation()));
                            } else if (state is LeaveError) {
                              Fluttertoast.showToast(
                                msg: state.error,
                              );
                            }
                          },
                        ),
                        color: Colors.teal,
                      ),
                      const SizedBox(width: 60,),
                      MaterialButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EmpNavigation()));
                      }
                        ,child: const Text("Cancel"),
                        color: Colors.teal,
                      ),
                    ],
                  ),

                ),
              )
            ],
            
          ),
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }
}
