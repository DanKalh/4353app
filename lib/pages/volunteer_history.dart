import 'package:flutter/material.dart';

class VolunteerHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for history
    final List<Map<String, String>> history = [
      {
        'eventName': 'Event 1',
        'eventDescription': 'Description for event 1',
        'location': 'Location 1',
        'date': '2023-06-23',
        'status': 'Completed'
      },
      {
        'eventName': 'Event 2',
        'eventDescription': 'Description for event 2',
        'location': 'Location 2',
        'date': '2023-06-24',
        'status': 'Pending'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Volunteer History')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('Event Name')),
                  DataColumn(label: Text('Description')),
                  DataColumn(label: Text('Location')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Status')),
                ],
                rows: history.map((event) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(event['eventName'])),
                      DataCell(Text(event['eventDescription'])),
                      DataCell(Text(event['location'])),
                      DataCell(Text(event['date'])),
                      DataCell(Text(event['status'])),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
