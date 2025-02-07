import 'package:flutter/material.dart';
import 'package:football_fusion/SingInPage.dart';
import 'package:football_fusion/management.dart';
import 'package:football_fusion/playerProfile.dart';
import 'package:football_fusion/slpadeshPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PlayerProfile(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();

  static const String KEYNAME = "name";
  String namevalue = "No value saved"; // Default value

  @override
  void initState() {
    super.initState();
    getvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Name",
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                await prefs.setString(KEYNAME, nameController.text);
                setState(() {
                  namevalue = nameController.text; // Update UI immediately
                });
              },
              child: Text('Save'),
            ),
            SizedBox(height: 20),
            Text(
              namevalue,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void getvalue() async {
    var prefs = await SharedPreferences.getInstance();
    String? getname = prefs.getString(KEYNAME);

    setState(() {
      namevalue = getname ?? "No value saved"; // Update UI inside setState
    });
  }
}
