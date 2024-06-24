import 'package:flutter/material.dart';
import 'package:your_app_name/services/events.dart';
import 'package:your_app_name/widgets/multi_select_form_field.dart';

class EventMgmtPage extends StatefulWidget {
  @override
  _EventMgmtPageState createState() => _EventMgmtPageState();
}

class _EventMgmtPageState extends State<EventMgmtPage> {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDescriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  List<String> requiredSkills = ['Skill1', 'Skill2', 'Skill3']; // Example skills
  List<String> selectedSkills = [];
  String selectedUrgency = 'Low';
  DateTime eventDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event Management')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: eventNameController,
                decoration: const InputDecoration(labelText: 'Event Name'),
                maxLength: 100,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the event name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: eventDescriptionController,
                decoration: const InputDecoration(labelText: 'Event Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the event description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the event location';
                  }
                  return null;
                },
              ),
              MultiSelectFormField(
                dataSource: requiredSkills,
                titleText: 'Required Skills',
                hintText: 'Please select one or more skills',
                initialValue: selectedSkills,
                onSaved: (value) {
                  setState(() {
                    selectedSkills = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select at least one skill';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: selectedUrgency,
                items: ['High', 'Medium', 'Low'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedUrgency = newValue!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Urgency'),
                validator: (value) => value == null ? 'Field required' : null,
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: eventDate,
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2025),
                  );
                  if (picked != null && picked != eventDate) {
                    setState(() {
                      eventDate = picked;
                    });
                  }
                },
                child: const Text('Select Event Date'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle event creation
                  final eventData = {
                    'name': eventNameController.text,
                    'description': eventDescriptionController.text,
                    'location': locationController.text,
                    'requiredSkills': selectedSkills,
                    'urgency': selectedUrgency,
                    'date': eventDate,
                  };
                  EventService().createEvent(eventData);
                },
                child: const Text('Create Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
