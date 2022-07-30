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
      body: SingleChildScrollView(
    child: Container(
    child:
    Column(
    children: [


    //Center(child: Text("MY PROFILE",style: TextStyle(fontSize: 20))),
    // Divider(
    //   thickness: 2,
    //
    // ),
    SizedBox(
    height: 10,
    ),SizedBox(

    height: 200,

    child: Stack(

    children: [

    const CircleAvatar(

    radius: 100,

    backgroundImage: AssetImage('assets/periyaar.png'),

    ),
    // Positioned(
    //
    //     right: 10,
    //
    //     top: 150,

    // child: IconButton(
    //
    //   onPressed: () {},
    //
    //   icon: const Icon(
    //
    //     Icons.camera_alt,
    //
    //     size: 40,
    //
    //
    //   ),
    //
    // ))



    ],

    ),

    ),
    SizedBox(
    height: 10,
    ),
    ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*0.60,
    color: Color(0xffFFFFFF),

    child: Column(
    children: [
    SizedBox(
    height: 20,
    ),
    Row(

    children: [
    Icon(Icons.account_box),

    Column(


    children: [

    SizedBox(
    width: 122,
    ),
    Text("Name:",style: TextStyle(fontSize: 20)),


    // Text("This is not your username or pin."
    //     "This name will be visible to your SuperAdmin and DeputyManager"),
    ],

    ),
    SizedBox(
    width: 150,
    ),
    // Icon(Icons.edit)
    ],
    ),
    SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.only(left: 60),
    child: Divider(
    height: 5,
    thickness: 0.5,
    color: Colors.grey,
    ),
    ),
    SizedBox(
    height: 20,
    ),
    Row(

    children: [
    Icon(Icons.mail),
    SizedBox(
    width: 40,
    ),

    Column(
    crossAxisAlignment: CrossAxisAlignment.start,


    children: [

    SizedBox(
    width: 122,
    ),
    Text("Email:",style: TextStyle(fontSize: 20)),



    ],

    ),
    SizedBox(
    width: 25,
    ),
    //Icon(Icons.edit,)
    ],
    ),
    SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.only(left:60.0),
    child: Divider(
    height: 5,
    thickness: 0.5,
    color: Colors.grey,
    ),
    ),
    SizedBox(
    height: 20,
    ),
    Row(

    children: [
    Icon(Icons.location_city_outlined),
    SizedBox(
    width: 40,
    ),

    Column(
    crossAxisAlignment: CrossAxisAlignment.start,


    children: [

    SizedBox(
    width: 122,
    ),
    Text("City:",style: TextStyle(fontSize: 20)),



    ],

    ),
    ],
    ),
    SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.only(left:60.0),
    child: Divider(
    height: 5,
    thickness: 0.5,
    color: Colors.grey,
    ),
    ),
    SizedBox(
    height: 20,
    ),
    Row(

    children: [
    Icon(Icons.phone),
    SizedBox(
    width: 40,
    ),

    Column(
    crossAxisAlignment: CrossAxisAlignment.start,


    children: [

    SizedBox(
    width: 122,
    ),
    Text("Phone:",style: TextStyle(fontSize: 20)),



    ],

    ),
    SizedBox(
    width: 110,
    ),
    //Icon(Icons.edit)
    ],
    ),

    ],
    ),

    ),
    ),
    )


    ],

    ),
    ),
      ),
    );
  }
}
