import 'package:flutter/material.dart';


class text_feild extends StatelessWidget {
 
const text_feild(this.answer,this.iswho,{super.key});
final String answer;
final bool iswho;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: iswho ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          height: 35,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: iswho ? const Color.fromARGB(255, 101, 180, 245) : const Color.fromARGB(255, 171, 162, 162),
            borderRadius:BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: iswho ? Radius.circular(10) : Radius.circular(0),
              bottomRight: iswho ? Radius.circular(0) : Radius.circular(10),
            ),
          ),
          child: Text(
            answer,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class Chat_app extends StatelessWidget {
  const Chat_app({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          text_feild("Hello! How are you?", true),
          text_feild("I'm good! How about you?", false),
          text_feild("I'm fine too!", true),
          text_feild("That's great to hear!", false),
          text_feild("what are you doing", true),
          text_feild("I was just working on my Project", false),
          text_feild("what about you", false),
          text_feild("Nothing! was just using my Phone", true),
        ],
      ),
    );
  }
}