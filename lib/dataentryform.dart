import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'config.dart';

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
    // Replace 'job' with your backend URL from the 'config.dart' file or your desired URL
    var url = Uri.parse(job);

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
        // Clear form fields after successful submission
        nameController.clear();
        emailController.clear();
        skillsController.clear();
        motivationController.clear();
        experienceController.clear();
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending data: $e');
    }
  }

  void checkExperienceAndSendData() {
    String experience = experienceController.text.trim();
    if (experience == '0') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Congratulations!'),
            content: Text('Hope this job is helpful for you.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  sendData();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (int.tryParse(experience) == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Input'),
            content: Text('Please enter a valid experience.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      int exp = int.parse(experience);
      if (exp >= 3 && exp <= 6) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Congratulations!'),
              content: Text('Great experience! Best of luck!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    sendData();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (exp >= 1 && exp <= 2) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Congratulations!'),
              content: Text('Hope this experience will help you in future.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    sendData();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        sendData();
      }
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
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: experienceController,
              decoration: InputDecoration(labelText: 'Experience'),
            ),
            TextFormField(
              controller: skillsController,
              decoration: InputDecoration(labelText: 'Skills'),
            ),
            TextFormField(
              controller: motivationController,
              decoration: InputDecoration(labelText: 'Motivation'),
              maxLines: null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                checkExperienceAndSendData();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
