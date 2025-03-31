import 'package:flutter/material.dart';
import 'package:flutter_application_6/cart_view.dart';
import 'package:flutter_application_6/chat.dart';

class optionScreen extends StatelessWidget {
  const optionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Flutter\'s Project',
              style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              ),
              ),
            SizedBox(height:10),
            ElevatedButton(
              child: Text('Cart',style: TextStyle(color: Colors.blue),),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewCart()));
              }
            ),
            SizedBox(height:10),
            ElevatedButton(
              child: Text('Chat',style: TextStyle(color: Colors.blue),),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat_app()));
              }
            )
          ],
        )
       ),
    );
  }
}