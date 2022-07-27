import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_app/adminnavigation.dart';
import 'package:leave_management_app/bloc/addstaffbloc.dart';

import 'package:leave_management_app/main.dart';

import 'adminhome.dart';

enum SingingCharacter { Male, Female }
class AddStaff extends StatefulWidget {
  @override
  _AddStaffState createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  TextEditingController nameController=TextEditingController(),
  emailController=TextEditingController(),
  genderController =TextEditingController(),
  phoneController=TextEditingController();
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
            MaterialButton(onPressed: (){
              BlocProvider.of<AddStaffBloc>(context).add(CheckSTAFF(
                  name: nameController.text,
                  email: emailController.text,
                  phoneNumber:phoneController.text,
                  password: "123456",
                  designation_id: "62dfad7f5a0e2a2034baeb59",
              gender: genderController.text));},child:BlocConsumer<AddStaffBloc, AddStaffState>(
              builder: (context, state) {
                if (state is CheckingStaff) {
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
                if (state is StaffChecked) {
                  Fluttertoast.showToast(
                    msg: "success"
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminNavigation()));



                } else if (state is StaffError) {
                  Fluttertoast.showToast(
                    msg: state.error,
                  );
                }
                else{
                  Container(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),),
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
            TextFormField(controller: nameController
              ,decoration: InputDecoration(labelText:'First Name'),
            ),

          ],
        ),
        isActive: _currentStep >=0,
        state: _currentStep <= 0 ?StepState.editing :StepState.complete,
      ),
      Step(title: Text('Email'),
        content: Column(
          children: [
            TextFormField(
              controller: emailController,decoration: InputDecoration(labelText:'Email'),
            ),
          ],
        ),
        isActive: _currentStep >= 1,
        state : _currentStep <= 1 ?StepState.editing :StepState.complete,
      ),
      Step(title: Text('Mobile '),
        content: Column(
          children: [
            TextFormField(controller: phoneController,
              decoration: InputDecoration(labelText:'Mobile No'),
            ),
          ],
        ),
        isActive: _currentStep >= 2,
        state : _currentStep <= 2 ?StepState.editing :StepState.complete,
      ),
      Step(title: Text('Gender '),
        content: Column(
          children: [
            TextFormField(controller:genderController
        ,decoration: InputDecoration(labelText:'gender  (male/female)'),
            ),
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
