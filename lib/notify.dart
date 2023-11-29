import 'package:flutter/material.dart';
import 'package:untitled/Homepage.dart';

class FriendsPage extends StatelessWidget {
  final List<Friend> friends = [
    Friend(name: 'John Smith', email: 'JohnSmith@gmail.com', description: 'Charles Otto Puth Jr. is an American singer, songwriter, and record producer. His initial exposure came through the viral success of his song covers uploaded to YouTube.', imageUrl: 'assets/images/friend.jpeg'),
    Friend(name: 'abc', email: 'abc@gmail.com', description: 'Shawn Peter Raul Mendes is a Canadian singer-songwriter. He gained a following in 2013, when he posted song covers on the video sharing platform Vine.', imageUrl: 'assets/images/friend2.jpeg'),
    Friend(name: 'xyz', email: 'xyz@gmail.com', description: 'Selena Marie Gomez is an American singer, actress, businesswoman and producer. She has won numerous accolades, including an American Music Award, two MTV Video Music Awards, broke 16 Guinness World Records, and received nominations for two Grammy Awards, a Golden Globe Award, and four Emmy Awards.', imageUrl: 'assets/images/friend3.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    friends.sort((a, b) => a.name.compareTo(b.name));

    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
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
              colors: [Colors.white, Colors.orange],
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
                        '500',
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
                        '200',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blueGrey,
                    ),
                    child: Text('Follow'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.blueGrey
                    ),
                    child: Text('Message'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  friend.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: Text('Portfolio content goes here'),
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
}

class Friend {
  final String name;
  final String email;
  final String description;
  final String imageUrl;

  Friend(
      {required this.name, required this.email, required this.description, required this.imageUrl});
}
