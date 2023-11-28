import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/Anotherpage.dart';
import 'config.dart';
import 'my_job.dart';
import 'my_network_page.dart';
import 'notify.dart';

class HomePage extends StatefulWidget {
  @override
  _ClassHomePageState createState() => _ClassHomePageState();
}

class _ClassHomePageState extends State<HomePage> {
  int userID = 123;
  PageController _pageController = PageController();
  int _currentIndex = 0;

  // Function to handle the creation of posts on like button press
  Future<void> createPost() async {
    // Replace with your backend URL

    try {
      final response = await http.post(
        Uri.parse(Post),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          // Your data to be sent in the POST request
          'userID': userID, // User ID obtained from the user
          'postID': UniqueKey().toString(), // Generate a unique post ID
          'content': 'Post content here', // Replace with the actual content
          // Other post data if needed
        }),
      );

      if (response.statusCode == 201) {
        // Handle successful post creation
        print('Post created successfully');
      } else {
        // Handle post creation failure
        print('Failed to create post');
      }
    } catch (error) {
      print('Error creating post: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => anotherpage()),
                );
              },
              child: Image.asset(
                'assets/images/linkedin.png',
                fit: BoxFit.contain,
                height: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(' Home Page'),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildBody('Home Page Content'),
          FriendsPage(),
          _buildBody('Post Page Content'),
          FriendsPage2(),
          _buildBody('Jobs Page Content'),
          MyNetwork(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.lightBlueAccent,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });

        switch (index) {
        case 1:
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FriendsPage()),
        );
        break;
        case 3:
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FriendsPage2()),
        );
        break;
        case 4:
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyNetwork()),
        );
        break;
        }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blueAccent),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.lightBlueAccent),
            backgroundColor: Colors.lightBlueAccent,
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add, color: Colors.lightBlueAccent),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work, color: Colors.lightBlueAccent),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'My Network',
          ),
        ],
      ),
    );
  }

  Widget _buildBody(String content) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Icon(Icons.person_add, size: 28),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Image.asset(
                  "assets/images/friend3.png",
                  width: 40,
                  height: 41,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tkxel",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "134,983 followers\n5h.Edited",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Calling all learning enthusiasts! Ready to drive professional growth? ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/picture1.png",
                  width: 387,
                  height: 211,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {
                        createPost();
                        // Add like functionality here
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {
                        // Add comment functionality here
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        // Add share functionality here
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Add other widgets as needed
        ],
      ),
    );
  }
}
