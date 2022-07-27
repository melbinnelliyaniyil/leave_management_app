import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leave_management_app/helper/tempstorage.dart';
import 'package:leave_management_app/login.dart';

class EmpProfile extends StatefulWidget {
  const EmpProfile({Key? key}) : super(key: key);

  @override
  State<EmpProfile> createState() => _EmpProfileState();
}

class _EmpProfileState extends State<EmpProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
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
              onTap: () {},
            ),
            ListTile(
              title: const Text('Leave Status'),
              onTap: () {
                Navigator.pop(context);
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
                        (Route<dynamic> route)=> false);
                Fluttertoast.showToast(msg: "Logged Out");
              },
            ),
          ],
        ),
      ),
    );
  }
}
