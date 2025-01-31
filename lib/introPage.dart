import 'package:flutter/material.dart';
import 'package:football_fusion/playerreg.dart';
import 'package:marquee/marquee.dart';
class Intropage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _introState();
  }
}

class _introState extends State<Intropage> {
  
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Player Registration"),
          content: Text("Are you sure you want to register?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Register"),
              onPressed: () {
                Navigator.of(context).pop();
                // Add registration logic here
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 30, 
          child: Marquee(
            text: "Welcome to the Football Fusion!          ",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            scrollAxis: Axis.horizontal, 
            crossAxisAlignment: CrossAxisAlignment.baseline,
            blankSpace: 40, 
            velocity: 50.0, 
            pauseAfterRound: Duration(seconds: 1), 
            startPadding: 10.0, 
          ),

          // flexibleSpace: Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/Football.png'), // Your image
          //       fit: BoxFit.cover, // Ensures full coverage
          //     ),
          //   ),
          // ),
        ),
        backgroundColor: Colors.blue,
      ),
      

      body: Container(
        height: double.infinity,
        width: double.infinity,
        color:  const Color.fromARGB(255, 110, 141, 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('Player Registration',style: TextStyle(fontSize: 21),),
            // SizedBox(height: 20,),

                Container(
                  height: 50,
                  width: 350,
                  color: Colors.blue,
                  child: FloatingActionButton(onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => Dialogbox()));
                  },child: Text("PLAYER"),)
                  
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 350,
                  color: Colors.blue,
                  child: FloatingActionButton(onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => Dialogbox()));
                }, child: Text("MANAGEMENT"))
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 350,
                  color: Colors.blue,
                  child: FloatingActionButton(onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => Dialogbox()));
                }, child: Text(""))
                )
              ],
            
      
        ),
      ),
    );
  }
  

}