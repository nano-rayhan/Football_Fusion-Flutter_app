import 'package:flutter/material.dart';
import 'package:football_fusion/SingInPage.dart';
import 'package:football_fusion/introPage.dart';

class Playerprofile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _playerProfile();
  }
}

class _playerProfile extends State<Playerprofile> {
  
  int selectedcontainer = 0;
  var name;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SizedBox(
          child: Text("My Profile", style: TextStyle(color: Colors.white),), ),
          actions: [
           IconButton(
      icon: Icon(Icons.search, color: Colors.white,), // Search icon
      onPressed: () {
        
      },
    ), 
    IconButton(
      icon: Icon(Icons.notifications,color: Colors.white,), // Notification icon
      onPressed: () {
        
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
                MaterialPageRoute(builder: (context) => PlayerSign()));
              },
            ),
          ],
        ),
      ),

      body:Center(child: Column(
          
          children: [
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              
              child: Column(
                children: [ 
                  SizedBox(height: 3,),
                  CircleAvatar(
              radius: 60, // Size of the avatar
              backgroundImage: AssetImage("assets/images/Football.png"), // Load from assets
            ),
            SizedBox(height: 10),
            Text("Md Rayhan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("rayhan@gmail.com", style: TextStyle(color: const Color.fromARGB(255, 10, 10, 10))),
          ])),
            
            SizedBox(height: 20,
              
            ),
            Container(
            height: 60,
            width: double.infinity,
            color: Colors.grey[200],
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTextButton("About", 1),
                  _buildTextButton("My Team", 2),
                  _buildTextButton("Score", 3),
                  _buildTextButton("History", 4),
                  _buildTextButton("Performance", 5),
                ],
              ),
            ),
          ),

          SizedBox(height: 2),
          

          // Content Section Based on Selection
          Expanded(
            
              child:  Container(
              height: double.infinity,
              width: double.infinity,
              // padding: EdgeInsets.all(10),
              
              child: _buildSelectedContainer(),
            ),
          ),
        ],
      ),
    ));
  }

  // Method to Build Text Buttons
  Widget _buildTextButton(String title, int index) {
    return  TextButton(
        onPressed: () {
          setState(() {
            selectedcontainer = index;
          });
        },
        child: Text(title, style: TextStyle(fontSize: 20)),
      
    );
  }

  // Method to Display the Selected Container
  Widget _buildSelectedContainer() {
    switch (selectedcontainer) {
      case 1:
        return _buildContainer("About", Colors.red,"Goal Kepper", " ");
      case 2:
        return My_team();
      case 3:
        return _buildContainer("Score", Colors.blueAccent,"","");
      case 4:
        return _buildContainer("History", Colors.green,"","");
      case 5:
        return _buildContainer("Performance", Colors.purple,"","");
      default:
        return Center(child: Text("Select an option above", style: TextStyle(fontSize: 18)));
    }
  }

  // Method to Build Each Container
  Widget _buildContainer(String title, Color color, String teamname, String DOB) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:  Container(
      width: double.infinity,
      height: double.infinity, // Covers Full Screen Below Buttons
      //color: color,
      //alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
        child: Column(
          children: [
            Text(teamname,style: TextStyle(fontSize: 30, color: const Color.fromARGB(255, 86, 176, 176)),),
            ListView(
              children: [

              ],
            )
          ],
        ),
      ),)
      )//Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
    );
    
  }
}


Widget My_team() {
  var arrName = ['Rahim', 'Karim', 'Jabbar', 'Sajid', 'Tamim']; // Sample team members
  return Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[200], 

      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "My Team",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),

          

          
          Positioned(
  bottom: 30,  
  right: 30,  
  child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(),  
      padding: EdgeInsets.all(20), 
      backgroundColor: Colors.red,
    ),
    child: Icon(Icons.add, size: 30, color: Colors.white),
  ),
),

        ],
      ),
    ),
  );
}