import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/config.dart';

import 'Homepage.dart';

class DataEntryFormforprofile extends StatefulWidget {
  @override
  _DataEntryFormState createState() => _DataEntryFormState();
}

class _DataEntryFormState extends State<DataEntryFormforprofile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController matricController = TextEditingController();
  final TextEditingController fscController = TextEditingController();
  final TextEditingController interestController = TextEditingController();
  final TextEditingController UniverstyController = TextEditingController();
  final TextEditingController IndustryController = TextEditingController();
  final TextEditingController CityController = TextEditingController();

  Future<bool> doesNameExist(String name) async {
    try {
      var url = Uri.parse('http://localhost:3006/profile-api/profile');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> profiles = jsonDecode(response.body)['Users'];
        return profiles.any((profile) => profile['Name'] == name);
      } else {
        print('Failed to fetch profiles. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error fetching profiles: $e');
      return false;
    }
  }

  Future<void> sendData() async {
    var name = nameController.text;
    var nameExists = await doesNameExist(name);

    if (nameExists) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Name Exists'),
            content: Text('The name already exists. Please choose a different name.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      var url = Uri.parse(profile); // Replace with your backend URL

      Map<String, dynamic> data = {
        'Name': nameController.text,
        'Matric': matricController.text,
        'FSC': fscController.text,
        'Interest': interestController.text,
        'Universty': UniverstyController.text,
        'Industry': IndustryController.text,
        'City': CityController.text,
      };

      try {
        var response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data),
        );

        if (response.statusCode == 200) {
          nameController.clear();
          matricController.clear();
          fscController.clear();
          interestController.clear();
          UniverstyController.clear();
          IndustryController.clear();
          CityController.clear();

          var responseData = jsonDecode(response.body);
          print('Response data: $responseData');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()), // Navigate to the homepage after successful submission
          );
          // Handle successful submission here
        } else {
          print('Failed to send data. Status code: ${response.statusCode}');
          // Handle error cases here
        }
      } catch (e) {
        print('Error sending data: $e');
        // Handle error cases here
      }
    }
  }

  void validateAndSubmitData() {
    if (nameController.text.isEmpty ||
        matricController.text.isEmpty ||
        fscController.text.isEmpty ||
        interestController.text.isEmpty ||
        UniverstyController.text.isEmpty ||
        IndustryController.text.isEmpty ||
        CityController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter Proper Information'),
            content: Text('Please fill in all fields before submitting.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      sendData(); // Call sendData function if all fields are filled
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextFormField(controller: matricController, decoration: InputDecoration(labelText: 'Matric')),
            TextFormField(controller: fscController, decoration: InputDecoration(labelText: 'Fsc')),
            TextFormField(controller: interestController, decoration: InputDecoration(labelText: 'Interest')),
            TextFormField(controller: UniverstyController, decoration: InputDecoration(labelText: 'Universty')),
            TextFormField(controller: IndustryController, decoration: InputDecoration(labelText: 'Industry')),
            TextFormField(controller: CityController, decoration: InputDecoration(labelText: 'City')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                validateAndSubmitData(); // Call the validation function before submitting data
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
