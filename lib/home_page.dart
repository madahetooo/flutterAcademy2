import 'package:flutter/material.dart';
import 'package:flutter_course/basic_widgets/bottom_navigation_bar_example.dart';
import 'package:flutter_course/basic_widgets/grid_view_example.dart';
import 'package:flutter_course/bmicalculator/bmi_calculator.dart';
import 'package:flutter_course/chat_app/chats_list_screen/ui/chats_list_screen.dart';
import 'package:flutter_course/reverse_string_app/reverse_string_app.dart';
import 'package:flutter_course/todolistapp/ui/todo_list.dart';
import 'package:flutter_course/world_time_api/ui/loading_time.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigatioNBarExample()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(35),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 4),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.green,
                              offset: Offset(6.0, 6.0),
                            )
                          ]),
                      child: const Text(
                        "Basic Widgets Apps",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BMICalculator()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(35),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 4),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.green,
                              offset: Offset(6.0, 6.0),
                            )
                          ]),
                      child: const Text(
                        "BMI Calculator",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodoListApp()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(35),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 4),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.green,
                              offset: Offset(6.0, 6.0),
                            )
                          ]),
                      child: const Text(
                        "Todolist Application",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                  Navigator.of(context,rootNavigator: true).pushNamed("/loading_time");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(35),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 4),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.green,
                              offset: Offset(6.0, 6.0),
                            )
                          ]),
                      child: const Text(
                        "WorldTimer Application",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatsListScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(35),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 4),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.green,
                              offset: Offset(6.0, 6.0),
                            )
                          ]),
                      child: const Text(
                        "Firebase Chat Application",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReverseStringApp()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(35),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 4),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.green,
                              offset: Offset(6.0, 6.0),
                            )
                          ]),
                      child: const Text(
                        "Reverse String Application",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        
        child: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Eslam Medhat",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                accountEmail: Text("ieslammedhat@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://yt3.ggpht.com/gco-xrRwhEl0-Z0ihTXHy9vAV1VXYjEJ5LZjufT9UBmN88adElZi9lebEzBbZVHdOSVRt6ok=s900-c-k-c0x00ffffff-no-rj"),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/uzOUInrE_400x400.jpg"),
                  )
                ],
              ),
              ListTile(
                title: Text("My Files"),
                leading: Icon(Icons.folder),
              ),
              ListTile(
                title: Text("Shared With Me"),
                leading: Icon(Icons.people),
              ),
              ListTile(
                title: Text("Starred"),
                leading: Icon(Icons.star),
              ),
              ListTile(
                title: Text("Recent"),
                leading: Icon(Icons.watch_later_outlined),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                title: Text("Offline"),
                leading: Icon(Icons.download_for_offline),
              ),
              ListTile(
                title: Text("Uploads"),
                leading: Icon(Icons.upload_rounded),
              ),
              ListTile(
                title: Text("Backups"),
                leading: Icon(Icons.backup),
              ),
              Divider(
                thickness: 1,
              ),
              ListTile(
                title: Text("Help"),
                leading: Icon(Icons.help),
              ),
              ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
