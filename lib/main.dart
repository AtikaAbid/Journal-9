import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food List App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(),
    );
  }
}

// ========================
// 1. Splash Screen
// ========================
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FoodListScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 100), // Replace with your logo
      ),
    );
  }
}

// ========================
// 2. Food List Screen
// ========================
class FoodListScreen extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {
      'image': 'assets/burger.jpg',
      'name': 'Burger',
      'description': 'A delicious beef burger with cheese.'
    },
    {
      'image': 'assets/pizza.jpg',
      'name': 'Pizza',
      'description': 'Cheesy pepperoni pizza slice.'
    },
    {
      'image': 'assets/salad.jpg',
      'name': 'Salad',
      'description': 'Fresh green salad with tomatoes.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food Items')),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return FoodItemCard(item: foodItems[index]);
        },
      ),
    );
  }
}

// ========================
// Food Item Widget
// ========================
class FoodItemCard extends StatefulWidget {
  final Map<String, String> item;

  FoodItemCard({required this.item});

  @override
  _FoodItemCardState createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 0.7,
      upperBound: 1.2,
    );
    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(widget.item['image']!, width: 80, height: 80, fit: BoxFit.cover),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item['name']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(widget.item['description']!),
                ],
              ),
            ),
            GestureDetector(
              onDoubleTap: toggleLike,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
