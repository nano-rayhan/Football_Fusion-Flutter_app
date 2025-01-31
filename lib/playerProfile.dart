import 'package:flutter/material.dart';
import 'package:football_fusion/introPage.dart';

class Playerprofile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _playerProfile();
  }
}

class _playerProfile extends State<Playerprofile> {
  var name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: SizedBox(
          child: Text("My Profile"), ),
          actions: [
           IconButton(
      icon: Icon(Icons.search), // Search icon
      onPressed: () {
        print("Search clicked!");
      },
    ), 
    IconButton(
      icon: Icon(Icons.notifications), // Notification icon
      onPressed: () {
        print("Notifications clicked!");
      },
    ),
    
  ],
          ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile.jpg'), // Profile image
                  ),
                  SizedBox(height: 10),
                  Text("John Doe", style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text("johndoe@gmail.com", style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.create),
              title: Text('Create Team'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Intropage()));
              },
            ),
          ],
        ),
      ),

      body:Center(child: Column(
          
          children: [
            CircleAvatar(
              radius: 60, // Size of the avatar
              backgroundImage: AssetImage("assets/images/Football.png"), // Load from assets
            ),
            SizedBox(height: 10),
            Text("${name}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("${context}", style: TextStyle(color: Colors.grey)),
            
          ],
        ),
      )
    );
  }
  
}