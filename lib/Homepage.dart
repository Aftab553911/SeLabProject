import 'package:flutter/material.dart';
import 'Anotherpage.dart';
import 'my_network_page.dart';
import 'notify.dart';
import 'my_job.dart';
import '';

class HomePage extends StatefulWidget {
  @override
  _ClassHomePageState createState() => _ClassHomePageState();
}

class _ClassHomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Navigation logic for the image tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => anotherpage()), // Replace with the desired page
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

          // Navigate to specific page based on the tapped icon
          switch (index) {
            case 1: // Notifications icon
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendsPage()),
              );
              break;
            case 3: // Jobs icon
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendsPage2()),
              );
              break;
            case 4: // My Network icon
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(content),
          ),
        ),
      ],
    );
  }
}
