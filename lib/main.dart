import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Root widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}

// ========================
// 1. Splash Screen
// ========================
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school, size: 100, color: Colors.blue),
              SizedBox(height: 20),
              Text('University App', style: TextStyle(fontSize: 24)),
              Text('(Double Tap Logo to Proceed)', style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

// ========================
// 2. Second Screen
// ========================
class SecondScreen extends StatelessWidget {
  final List<Tab> myTabs = [
    Tab(icon: Icon(Icons.person), text: 'About Me'),
    Tab(icon: Icon(Icons.location_city), text: 'Hometown'),
    Tab(icon: Icon(Icons.school_outlined), text: 'Student Life'),
  ];

  final List<String> tabContents = [
    'My name is Atika Abid. I am a CS student.',
    'My hometown is Karachi, a vibrant city in Pakistan.',
    'I study at Bahria University. I love coding and exploring technology.',
  ];

  final List<String> detailedContents = [
    'My name is Atika Abid. I am currently pursuing my degree in Computer Science. I love exploring new technologies, especially related to AI and Mobile Development.',
    'Karachi is the largest city of Pakistan, known for its diverse culture, food, and coastal views.',
    'At Bahria University, I have worked on various projects, gained practical experience, and participated in many tech and academic events.',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Atika Abid'),
          bottom: TabBar(tabs: myTabs),
        ),
        body: TabBarView(
          children: List.generate(myTabs.length, (index) {
            return Center(
              child: GestureDetector(
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ThirdScreen(detailedText: detailedContents[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    tabContents[index],
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// ========================
// 3. Third Screen
// ========================
class ThirdScreen extends StatelessWidget {
  final String detailedText;

  ThirdScreen({required this.detailedText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            detailedText,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
