import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:leave_management_app/main.dart';

enum SingingCharacter { Male, Female }
class AddStaff extends StatefulWidget {
  @override
  _AddStaffState createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  String title='stepper';
  bool _value = false;
  int val = 1;
  int value=0;
  String? dropdownValue;
  final _dropdownFormKey = GlobalKey<FormState>();

  SingingCharacter? _character = SingingCharacter.Male;
  int _currentStep =0;

  get dropdownItems => null;
  @override


  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Add Employee'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stepper(steps: _stepper(),
              physics: ClampingScrollPhysics(),
              currentStep: this._currentStep,
              onStepTapped: (step) {
                setState(() {
                  this._currentStep = step;
                });
              },
              onStepContinue: () {
                setState(() {
                  if (this._currentStep < this
                      ._stepper()
                      .length - 1) {
                    this._currentStep = this._currentStep + 1;
                  } else {
                    print("complete");
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (this._currentStep > 0) {
                    this._currentStep = this._currentStep - 1;
                  } else {
                    this._currentStep = 0;
                  }
                });
              },


            ),
            OutlinedButton(onPressed: (){},child:Text("SUBMIT",style: TextStyle(color:Colors.green)),),
          ],
        ),
      ),

    );

  }

  List<Step> _stepper() {
    List<Step> _steps = [
      Step(title: Text('Name'),
        content: Column(
          children: [
            TextFormField(decoration: InputDecoration(labelText:'First Name'),
            ),
            TextFormField(decoration: InputDecoration(labelText:'Last Name'),
            ),
          ],
        ),
        isActive: _currentStep >=0,
        state: _currentStep <= 0 ?StepState.editing :StepState.complete,
      ),
      Step(title: Text('Email'),
        content: Column(
          children: [
            TextFormField(decoration: InputDecoration(labelText:'Email'),
            ),
          ],
        ),
        isActive: _currentStep >= 1,
        state : _currentStep <= 1 ?StepState.editing :StepState.complete,
      ),
      Step(title: Text('Mobile '),
        content: Column(
          children: [
            TextFormField(decoration: InputDecoration(labelText:'Mobile No'),
            ),
          ],
        ),
        isActive: _currentStep >= 2,
        state : _currentStep <= 2 ?StepState.editing :StepState.complete,
      ),
      Step(title: Text('Gender '),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('Male'),
              leading: Radio<SingingCharacter>(
                activeColor: Colors.blue,
                value: SingingCharacter.Male,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio<SingingCharacter>(
                activeColor: Colors.blue,
                value: SingingCharacter.Female,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            )
          ],

        ),
        isActive: _currentStep >= 3,
        state : _currentStep <= 3 ?StepState.editing :StepState.complete,
      ),
      Step(title: Text('Designation '),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide( width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide( width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  hintText: 'Select Item'
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Employee', 'Others']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

          ],
        ),

        isActive: _currentStep >= 4,
        state : _currentStep <= 4 ?StepState.editing :StepState.complete,
      ),
    ];
    return _steps;
  }


}
