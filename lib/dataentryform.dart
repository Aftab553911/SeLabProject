import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled/config.dart';

class DataEntryForm extends StatefulWidget {
  @override
  _DataEntryFormState createState() => _DataEntryFormState();
}
class _DataEntryFormState extends State<DataEntryForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController motivationController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();

  Future<void> sendData() async {
    var url = Uri.parse(job); // Replace with your backend URL

    Map<String, dynamic> data = {
      'Name': nameController.text,
      'Experience': experienceController.text,
      'Skill': skillsController.text,
      'Motivation': motivationController.text,
      'Email': emailController.text,
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
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Entry Form')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextFormField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextFormField(controller: experienceController, decoration: InputDecoration(labelText: 'Experience')),
            TextFormField(controller: skillsController, decoration: InputDecoration(labelText: 'Skills')),
            TextFormField(controller: motivationController, decoration: InputDecoration(labelText: 'Motivation'), maxLines: null),

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