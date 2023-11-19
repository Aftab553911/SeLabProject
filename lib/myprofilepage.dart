import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled/Homepage.dart';

// Assuming 'profile' is defined in config.dart
import 'config.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _matricController = TextEditingController();
  TextEditingController _fscController = TextEditingController();
  TextEditingController _interestController = TextEditingController();
  TextEditingController _universityController = TextEditingController();
  TextEditingController _industryController = TextEditingController();
  TextEditingController _cityController = TextEditingController();

  List<TextEditingController> controllers = [];
  @override
  void initState() {
    super.initState();
    controllers = [
      _nameController,
      _matricController,
      _fscController,
      _interestController,
      _universityController,
      _industryController,
      _cityController,
    ];
  }
  Future<void> saveProfileData(Map<String, dynamic> profileData) async {
    var url = Uri.parse(profile); // Replace with your server URL

    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(profileData),
    );
    if (response.statusCode == 200) {
      print('Profile data saved successfully');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));// Replace '/' with your homepage route
    } else {
      print('Failed to save profile data');
    }
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/linkedin.png', // Replace with your logo
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // On button press, open dropdown form
                  showProfileForm(context);
                },
                child: Text('Create My Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show the profile form
  void showProfileForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Profile'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: _matricController,
                  decoration: InputDecoration(labelText: 'Matric'),
                ),
                TextFormField(
                  controller: _fscController,
                  decoration: InputDecoration(labelText: 'FSC'),
                ),
                TextFormField(
                  controller: _interestController,
                  decoration: InputDecoration(labelText: 'Interest'),
                ),
                TextFormField(
                  controller: _universityController,
                  decoration: InputDecoration(labelText: 'University'),
                ),
                TextFormField(
                  controller: _industryController,
                  decoration: InputDecoration(labelText: 'Industry'),
                ),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(labelText: 'City'),
                ),
                // Other TextFormField widgets for different fields

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // Create a map with the profile data from text controllers
                    Map<String, dynamic> profileData = {
                      'name': _nameController.text,
                      'matric': _matricController.text,
                      'fsc': _fscController.text,
                      'interest': _interestController.text,
                      'industry': _industryController.text,
                      'university': _universityController.text,
                      'city': _cityController.text,
                      // Add other profile data fields here
                    };

                    // Call the function to send data to the database
                    await saveProfileData(profileData);

                    // Clear text fields after saving data
                    controllers.forEach((controller) {
                      controller.clear();
                    });
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
