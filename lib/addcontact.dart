import 'package:flutter/material.dart';
import 'main.dart';

class AddContact extends StatefulWidget{
  _AddContactState createState()=>_AddContactState();
}
class _AddContactState extends State<AddContact>{
  TextEditingController _controller=TextEditingController();
  TextEditingController _phonecontroller=TextEditingController();
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title:Text('Add Contact'),
      ),
      body:Center(
        child:Column(
          children: [
            TextField(
              controller: _controller,
              decoration:InputDecoration(
                labelText: "name",
              ),
            ),
            TextField(
              controller: _phonecontroller,
              decoration:InputDecoration(
                labelText: "Phone Number",
              ),
            ),
            ElevatedButton(onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>MyApp()));
            }, child:Text('Add Contact'),
            ),
            ElevatedButton(onPressed:(){
              Navigator.pop(context);
            }, child:Text('Leave'),
            ),
          ],)
        ),
      )
    ); 
  }
}