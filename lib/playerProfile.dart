import 'package:flutter/material.dart';
import 'package:football_fusion/SingInPage.dart';

class PlayerProfile extends StatefulWidget {
  @override
  _PlayerProfileState createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  int selectedContainer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("My Profile", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
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
                    backgroundImage: AssetImage('assets/profile.jpg'),
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.create),
              title: Text("Create Team"),
              onTap: () {},
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerSign()));
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/Football.png"),
            ),
            SizedBox(height: 10),
            Text("Md Rayhan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("rayhan@gmail.com"),

            SizedBox(height: 20),
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

            // ✅ Content Section Based on Selection
            Expanded(
              child: _buildSelectedContainer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextButton(String title, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedContainer = index;
        });
      },
      child: Text(title, style: TextStyle(fontSize: 20)),
    );
  }

  Widget _buildSelectedContainer() {
    switch (selectedContainer) {
      case 1:
        return _buildContainer("About", Colors.red, "Goal Keeper", " ");
      case 2:
        return MyTeam();
      case 3:
        return _buildContainer("Score", Colors.blueAccent, "", "");
      case 4:
        return _buildContainer("History", Colors.green, "", "");
      case 5:
        return _buildContainer("Performance", Colors.purple, "", "");
      default:
        return Center(child: Text("Select an option above", style: TextStyle(fontSize: 18)));
    }
  }

  Widget _buildContainer(String title, Color color, String teamName, String dob) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(teamName, style: TextStyle(fontSize: 30, color: Colors.teal)),
          ListView(
            shrinkWrap: true,
            children: [],
          ),
        ],
      ),
    );
  }
}

class MyTeam extends StatefulWidget {
  @override
  _MyTeamState createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {
  List<String> arrName = ['Rahim', 'Karim', 'Jabbar', 'Sajid', 'Tamim'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        children: [
          SizedBox(height: 20),
          Text("My Team", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),

          Expanded(
            child: ListView.separated(
              itemCount: arrName.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: [
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/font1.png'),
                      ),
                      SizedBox(width: 10),
                      Text(arrName[index], style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _deleteItem(index); // ✅ ফাংশন ঠিকভাবে কল করা হয়েছে
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(height: 5);
              },
            ),
          ),

          FloatingActionButton(
            onPressed: () {
              _showAddDialog(); // ✅ এখন Add Button কাজ করবে
            },
            backgroundColor: Colors.red,
            child: Icon(Icons.add, size: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _deleteItem(int index) {
    setState(() {
      arrName.removeAt(index); // ✅ লিস্ট থেকে নাম রিমুভ করা হচ্ছে
    });
  }

  void _showAddDialog() {
    TextEditingController _textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Team Member"),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: "Enter Name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cancel করলে ডায়লগ বন্ধ হবে
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  setState(() {
                    arrName.add(_textController.text); // ✅ List এ নাম Add হচ্ছে
                  });
                  Navigator.pop(context); // Dialog বন্ধ
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }
}
