import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leave_management_app/adminhome.dart';
import 'package:leave_management_app/emphome.dart';
import 'package:leave_management_app/navigation.dart';

import 'bloc/logauth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:DecorationImage(image: AssetImage("assets/login.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(

                            controller: emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: passwordController,
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),

                              Container(
                                width: 100,height: 44,
                                child: MaterialButton(
                                  onPressed: () {
                                    BlocProvider.of<AuthBloc>(context).add(CheckOTP(
                                        phone: emailController.text,
                                        otpNumber: passwordController.text));

                                  },
                                  color: Colors.transparent,
                                  height: 50,
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: BlocConsumer<AuthBloc, AuthState>(
                                    builder: (context, state) {
                                      if (state is CheckingOtp) {
                                        return Container(
                                          height: 22,
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Text(
                                          "Log in",
                                          style: TextStyle(fontSize: 14),
                                        );
                                      }
                                    },
                                    listener: (context, state) {
                                      if (state is OtpChecked) {

                                        if(state.role =='Admin'){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHome()));
                                        }

                                        else if(state.role=='Employee'){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EmpHome()));
                                        }
                                      } else if (state is OtpError) {
                                        Fluttertoast.showToast(
                                          msg: state.error,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}