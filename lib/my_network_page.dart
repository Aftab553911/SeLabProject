import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MyNetwork extends StatelessWidget {


  void sendDataToServer(String name, String action, String additionalData) async {
    try {
      String serverUrl = 'http://localhost:3007/connect'; // Replace with your actual server URL
      Map<String, dynamic> data = {
        'name': name,
        'action': action,
        'additionalData': additionalData,
      };

      var response = await http.post(
        Uri.parse(serverUrl),
        body: jsonEncode(data),
        headers: {"Content-Type":"application/json"},
      );

      if (response.statusCode == 200) {
        print('Server Response: ${response.body}');
        // Handle success - Update UI or perform other actions
      } else {
        print('Request failed with status: ${response.statusCode}');
        // Handle error - Display an error message or take appropriate action
      }
    } catch (error) {
      print('Error sending data: $error');
      // Handle exception - Display an error message or take appropriate action
    }
  }
  @override
  Widget build(BuildContext context) {
    print("Building MyNetwork widget"); // Added print statement

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Network'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenWidth,
              height: 55,
            ),
            ResponsiveContainer(
              width: screenWidth,
              height: 276,
              color: Color(0xffefdede),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomListItem(
                    text: "ABC follows this Company 1 month ago",
                    showIcons: true,
                  ),
                  CustomListItem(
                    text: "XYZ follows this company 2 months ago",
                    showIcons: true,
                  ),
                ],
              ),
            ),
            ResponsiveContainer(
              width: screenWidth,
              height: 448,
              color: Color(0xffd9d9d9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResponsiveText(
                    text: "People you may know from University of Engineering and Technology",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  Builder(
                    builder: (BuildContext context) {
                      print("Building Image 1");
                      return Image.asset(
                        "assets/images/friend2.png",
                        width: 116,
                        height: 116,
                      );
                    },
                  ),
                  SizedBox(height: 10),

                  ResponsiveText(
                    text: "Mahnoor Akram",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  ResponsiveText(
                    text: "Software Developer",
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  ResponsiveText(
                    text: "6 mutual friends",
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add your connect logic here
                      sendDataToServer('Mahnoor Akram', 'connect', 'Replace this with real data');
                    },
                    child: Text("Connect"),
                  ),
                  Builder(
                    builder: (BuildContext context) {
                      print("Building Image 3");
                      return Image.asset(
                        "assets/images/friend2.png",
                        width: 111,
                        height: 105,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  ResponsiveText(
                    text: "Sarooosh Ziyaa",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  ResponsiveText(
                    text: "UI/UX Designer",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  ResponsiveText(
                    text: "2 mutual friends",
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add your connect logic here
                      sendDataToServer('Sarooosh Ziyaa', 'connect', 'Replace this with real data');
                    },
                    child: Text("Connect"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ResponsiveContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;

  ResponsiveContainer({required this.width, required this.height, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
      ),
      child: child,
    );
  }
}

class ResponsiveText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  ResponsiveText({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final String text;
  final bool showIcons;

  CustomListItem({required this.text, this.showIcons = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        if (showIcons)
          Row(
            children: [
              Icon(Icons.check, color: Colors.green), // Checkmark icon
              SizedBox(width: 8), // Spacing
              Icon(Icons.clear, color: Colors.red), // Cross icon
            ],
          ),
      ],
    );
  }
}
