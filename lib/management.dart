import 'package:flutter/material.dart';

void main() {
  runApp(TournamentApp());
}

class TournamentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MatchScheduleScreen(),
    );
  }
}

class MatchScheduleScreen extends StatefulWidget {
  @override
  _MatchScheduleScreenState createState() => _MatchScheduleScreenState();
}

class _MatchScheduleScreenState extends State<MatchScheduleScreen> {
  final List<Map<String, String>> matches = [];

  final TextEditingController team1Controller = TextEditingController();
  final TextEditingController team2Controller = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController venueController = TextEditingController();

  void addMatch() {
    if (team1Controller.text.isNotEmpty &&
        team2Controller.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        timeController.text.isNotEmpty &&
        venueController.text.isNotEmpty) {
      setState(() {
        matches.add({
          'team1': team1Controller.text,
          'team2': team2Controller.text,
          'date': dateController.text,
          'time': timeController.text,
          'venue': venueController.text,
        });
      });
      team1Controller.clear();
      team2Controller.clear();
      dateController.clear();
      timeController.clear();
      venueController.clear();
    }
  }

  void deleteMatch(int index) {
    setState(() {
      matches.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Match Scheduler')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: team1Controller, decoration: InputDecoration(labelText: 'Team 1')),
            TextField(controller: team2Controller, decoration: InputDecoration(labelText: 'Team 2')),
            TextField(controller: dateController, decoration: InputDecoration(labelText: 'Date')),
            TextField(controller: timeController, decoration: InputDecoration(labelText: 'Time')),
            TextField(controller: venueController, decoration: InputDecoration(labelText: 'Venue')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: addMatch, child: Text('Add Match')),
            Expanded(
              child: ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('${matches[index]['team1']} vs ${matches[index]['team2']}'),
                      subtitle: Text('Date: ${matches[index]['date']}, Time: ${matches[index]['time']}, Venue: ${matches[index]['venue']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteMatch(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
