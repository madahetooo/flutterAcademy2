import 'package:flutter/material.dart';
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
        title: Text("Home Page"),
      ),
      body: const Center(
        child: Text(
          "THIS IS A TEXT",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.red,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: const <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Eslam Medhat",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),),
              accountEmail: Text("ieslammedhat@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://yt3.ggpht.com/gco-xrRwhEl0-Z0ihTXHy9vAV1VXYjEJ5LZjufT9UBmN88adElZi9lebEzBbZVHdOSVRt6ok=s900-c-k-c0x00ffffff-no-rj"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/uzOUInrE_400x400.jpg"),
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
            Divider(thickness: 1,),
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
            Divider(thickness: 1,),
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
