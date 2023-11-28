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

  Future<void> sendData() async {
    var url = Uri.parse(profile); // Replace with your backend URL

    Map<String, dynamic> data = {
      'Name': nameController.text,
      'Matric': matricController.text,
      'Fsc': fscController.text,
    };

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
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

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendData(); // Call the function to send data
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
