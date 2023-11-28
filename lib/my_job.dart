
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'dataentryform.dart';
import 'notify.dart';

class FriendsPage2 extends StatefulWidget {
  @override
  _FriendsPage2State createState() => _FriendsPage2State();
}

class _FriendsPage2State extends State<FriendsPage2> {
  final List<Friend> friends = [
    Friend(name: 'Frontend-Developer', email: 'www-frontend@gmail.com', description: 'A rapidly-growing company that transmits high-definition water data to users smartphones by harnessing the power of ultrasound, is looking for a Flutter Engineer. The engineer will be responsible for streamlining the data delivery and improving customer experience through app improvements and stabilization. The startup is building a non-intrusive, all-purpose flow meter that can track and monitor water use and instantly identify water leaks. This is an excellent opportunity for developers who are interested in working in a dynamic, fast-paced, and agile environment.',AboutUs: 'A rapidly-growing company that transmits high-definition water data to users smartphones by harnessing the power of ultrasound, is looking for a Flutter Engineer. The engineer will be responsible for streamlining the data delivery and improving customer experience through app improvements and stabilization. The startup is building a non-intrusive, all-purpose flow meter that can track and monitor water use and instantly identify water leaks. This is an excellent opportunity for developers who are interested in working in a dynamic, fast-paced, and agile environment.', imageUrl: 'assets/images/friend.jpeg'),
    Friend(name: 'Traniee Software Engineer', email: 'trainee@gmail.com', description: 'INTECH Automation Intelligence is looking for an energized and capable Trainee Software Engineer (Information Systems)',AboutUs:'INTECH Automation Intelligence has been helping businesses transform for the future through next-generation Automation and Digital technologies for the past 30 years and counting. We are a globally renowned engineering company specializing in automation, electrical, energy transition, and digitalization solutions. Our application-specific solutions diversified and technically backed portfolio and expertise in equipment ', imageUrl: 'assets/images/friend2.jpeg'),
    Friend(name: 'Web- Developer', email: 'www-web@gmail.com', description: 'A rapidly-growing company that transmits high-definition water data to users smartphones by harnessing the power of ultrasound, is looking for a Flutter Engineer. The engineer will be responsible for streamlining the data delivery and improving customer experience through app improvements and stabilization. The startup is building a non-intrusive, all-purpose flow meter that can track and monitor water use and instantly identify water leaks. This is an excellent opportunity for developers who are interested in working in a dynamic, fast-paced, and agile environment.',AboutUs: 'A rapidly-growing company that transmits high-definition water data to users smartphones by harnessing the power of ultrasound, is looking for a Flutter Engineer. The engineer will be responsible for streamlining the data delivery and improving customer experience through app improvements and stabilization. The startup is building a non-intrusive, all-purpose flow meter that can track and monitor water use and instantly identify water leaks. This is an excellent opportunity for developers who are interested in working in a dynamic, fast-paced, and agile environment.', imageUrl: 'assets/images/friend.jpeg'),
    Friend(name: 'Traniee Software Engineer', email: 'trainee@gmail.com', description: 'INTECH Automation Intelligence is looking for an energized and capable Trainee Software Engineer (Information Systems)',AboutUs:'INTECH Automation Intelligence has been helping businesses transform for the future through next-generation Automation and Digital technologies for the past 30 years and counting. We are a globally renowned engineering company specializing in automation, electrical, energy transition, and digitalization solutions. Our application-specific solutions diversified and technically backed portfolio and expertise in equipment ', imageUrl: 'assets/images/friend2.jpeg'),
    Friend(name: 'iOS Developer', email: 'wwwdeveloper@gmail.com', description: 'Selena Marie Gomez is an American singer, actress, businesswoman and producer. She has won numerous accolades, including an American Music Award, two MTV Video Music Awards, broke 16 Guinness World Records, and received nominations for two Grammy Awards, a Golden Globe Award, and four Emmy Awards.', AboutUs: 'Crossover is the worlds #1 source of full-time remote jobs. Our clients offer top-tier pay for top-tier talent. Were recruiting this role for our client, gt.school. Have you got what it takes?', imageUrl: 'assets/images/friend3.jpeg'),
    Friend(name: 'iOS Developer', email: 'wwwdeveloper@gmail.com', description: 'Selena Marie Gomez is an American singer, actress, businesswoman and producer. She has won numerous accolades, including an American Music Award, two MTV Video Music Awards, broke 16 Guinness World Records, and received nominations for two Grammy Awards, a Golden Globe Award, and four Emmy Awards.', AboutUs: 'Crossover is the worlds #1 source of full-time remote jobs. Our clients offer top-tier pay for top-tier talent. Were recruiting this role for our client, gt.school. Have you got what it takes?', imageUrl: 'assets/images/friend3.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JOBS'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(friends[index].imageUrl),
            ),
            title: Text(friends[index].name),
            subtitle: Text('Email: ${friends[index].email}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(friends[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Friend friend;

  ProfilePage(this.friend);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile: ${friend.name}'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Portfolio'),
              Tab(text: 'Skills'),
              Tab(text: 'Achievements'),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.lightBlueAccent],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(friend.imageUrl),
                  radius: 80,
                ),
              ),
              // Display Followers and Following
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Followers',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '500', // Replace with actual number of followers
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '200', // Replace with actual number of following
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Buttons to Follow and Hire
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement follow functionality
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blueAccent,
                    ),
                    child: Text('Follow'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => DataEntryForm()));
                      // Implement hire functionality
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blue,
                    ),
                    child: Text('Apply job'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Description
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  friend.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              // Tab Bar for Portfolio, Skills, and Achievements
              Expanded(
                child: TabBarView(
                  children: [
                    // Portfolio Tab
                    Center(
                      child: Text('Portfolio content goes here'),
                    ),
                    // Skills Tab
                    Center(
                      child: Text('Skills content goes here'),
                    ),
                    // Achievements Tab
                    Center(
                      child: Text('Achievements content goes here'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} // ..// . Rest of your ProfilePage implementation
class Friend {
  final String name;
  final String email;
  final String description;
  final String AboutUs;
  final String imageUrl;
  Friend(
      {required this.name, required this.email, required this.description,required this.AboutUs, required this.imageUrl});
}