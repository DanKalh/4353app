import 'package:flutter/material.dart';

class VolunteerMatchingPage extends StatelessWidget {
  // Dummy data for matching
  final List<Map<String, String>> volunteers = [
    {'name': 'John Doe', 'skills': 'Skill1, Skill2'},
    {'name': 'Jane Smith', 'skills': 'Skill3, Skill4'},
  ];

  final List<Map<String, String>> events = [
    {'name': 'Event 1', 'requiredSkills': 'Skill1'},
    {'name': 'Event 2', 'requiredSkills': 'Skill3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Volunteer Matching')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              items: volunteers.map((volunteer) {
                return DropdownMenuItem<String>(
                  value: volunteer['name'],
                  child: Text(volunteer['name']),
                );
              }).toList(),
              onChanged: (_) {},
              decoration: InputDecoration(labelText: 'Volunteer Name'),
            ),
            DropdownButtonFormField<String>(
              items: events.map((event) {
                return DropdownMenuItem<String>(
                  value: event['name'],
                  child: Text(event['name']),
                );
              }).toList(),
              onChanged: (_) {},
              decoration: InputDecoration(labelText: 'Matched Event'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle volunteer matching
              },
              child: Text('Match Volunteer'),
            ),
          ],
        ),
      ),
    );
  }
}
