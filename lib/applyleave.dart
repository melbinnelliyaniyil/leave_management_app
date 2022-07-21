import 'package:flutter/material.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({Key? key}) : super(key: key);

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  int _value = 1;
  List items = ['Casual leave', 'Sick leave', 'Duty leave'];
  String? selectedItem = 'Casual leave';
  DateTimeRange dateRange=DateTimeRange(
      start: DateTime(2022,6,01),
      end: DateTime(2030,12,31)
  );
  @override
  Widget build(BuildContext context) {
    final start =dateRange.start;
    final end=dateRange.end;
    final difference=dateRange.duration;

    return Scaffold(
      appBar: AppBar(
        title: Text("Leave Application"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Leave Type",style: TextStyle(fontSize: 21),),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DropdownButton(
                value: selectedItem,
                items: items
                    .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(fontSize: 19),
                    )))
                    .toList(),
                onChanged: (item) => setState(() => selectedItem = item as String?),
              ),
            ),
            Text("Day Type",style: TextStyle(fontSize: 21),),


            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: _value,
                  onChanged: (value){
                    setState((){
                      _value = value as int;
                    });
                  },),
                SizedBox(
                    width:10.0
                ),
                Text("Full Day"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: _value,
                  onChanged: (value){
                    setState((){
                      _value = value as int;
                    });
                  },),
                SizedBox(
                    width:10.0
                ),
                Text("First Half"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 3,
                  groupValue: _value,
                  onChanged: (value){
                    setState((){
                      _value = value as int;
                    });
                  },),
                SizedBox(
                    width:10.0
                ),
                Text("Second Half"),
              ],
            ),
            Text("Select Date",style: TextStyle(fontSize: 21),),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child:ElevatedButton(
                  child: Text('${start.day}/${start.month}/${start.year}'),
                  onPressed: pickDateRange,
                ),
                ),
                const SizedBox(height: 12),
                Expanded(child:ElevatedButton(
                  child: Text('${end.day}/${end.month}/${end.year}'),
                  onPressed: pickDateRange,
                ),
                ),

              ],
            ),
            const SizedBox(height: 16),
            Text('No of days selected:${difference.inDays}days',
              style: TextStyle(fontSize: 19),
            ),
          ],
        ),

      ),
    );
  }
  Future pickDateRange() async {
    DateTimeRange? newDateRange= await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if(newDateRange==null) return;
    setState(()=>dateRange=newDateRange);
  }
}
