import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final String name;
  const Cart(this.name,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:const Color.fromARGB(255, 2, 54, 96),
      padding: EdgeInsets.all(5),
      height: 70,
      child: Card(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 10),
            Icon(Icons.person),
            Expanded(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(name),
                  ],
                ),
              ),
          ],)
      ),
    );
  }
}

class ViewCart extends StatelessWidget {
  const ViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body:ListView(
        children: [
          Cart("Item 1"),
          Cart("Item 2"),
          Cart("Item 3"),
          Cart("Item 4"),
          Cart("Item 5"),
          Cart("Item 6"),
          Cart("Item 7"),
          Cart("Item 8"),
          Cart("Item 9"),
          Cart("Item 10"),
          Cart("Item 11"),
          Cart("Item 12"),
          Cart("Item 13"),
          Cart("Item 14"),
          Cart("Item 15"),
          Cart("Item 16"),
          Cart("Item 17"),
          Cart("Item 18"),
          Cart("Item 19"),
          Cart("Item 20"),
        ],
      ),
    );
  }
}