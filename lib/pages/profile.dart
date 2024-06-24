import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController preferencesController = TextEditingController();
  List<String> skills = ['Skill1', 'Skill2', 'Skill3']; // Example skills
  List<String> selectedSkills = [];
  List<DateTime> availability = [];
  String selectedState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
                maxLength: 50,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: address1Controller,
                decoration: InputDecoration(labelText: 'Address 1'),
                maxLength: 100,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: address2Controller,
                decoration: InputDecoration(labelText: 'Address 2'),
                maxLength: 100,
              ),
              TextFormField(
                controller: cityController,
                decoration: InputDecoration(labelText: 'City'),
                maxLength: 100,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: selectedState,
                items: ['State1', 'State2'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedState = newValue;
                  });
                },
                decoration: InputDecoration(labelText: 'State'),
                validator: (value) => value == null ? 'Field required' : null,
              ),
              TextFormField(
                controller: zipCodeController,
                decoration: InputDecoration(labelText: 'Zip Code'),
                maxLength: 9,
                validator: (value) {
                  if (value == null || value.length < 5) {
                    return 'Please enter a valid zip code';
                  }
                  return null;
                },
              ),
              MultiSelectFormField(
                autovalidate: false,
                titleText: 'Skills',
                dataSource: [
                  {'display': 'Skill1', 'value': 'Skill1'},
                  {'display': 'Skill2', 'value': 'Skill2'},
                  {'display': 'Skill3', 'value': 'Skill3'},
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                hintText: 'Please select one or more skills',
                initialValue: selectedSkills,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    selectedSkills = value;
                  });
                },
              ),
              TextFormField(
                controller: preferencesController,
                decoration: InputDecoration(labelText: 'Preferences'),
                maxLines: 3,
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2025),
                  );
                  if (picked != null && !availability.contains(picked)) {
                    setState(() {
                      availability.add(picked);
                    });
                  }
                },
                child: Text('Select Availability Dates'),
              ),
              Wrap(
                children: availability.map((date) {
                  return Chip(
                    label: Text(date.toLocal().toString().split(' ')[0]),
                    onDeleted: () {
                      setState(() {
                        availability.remove(date);
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle profile update
                },
                child: Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
