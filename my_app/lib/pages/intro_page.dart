import 'package:flutter/material.dart';
import 'package:my_app/pages/home.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(
                top: 160, bottom: 40, right: 80, left: 80),
            child: Image.asset('assets/avo.jpg'),
          ),

          //caption

          Padding(
            padding: const EdgeInsets.all(24),
            child: Text("We deliver groceries at your doorstep",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
          ),
          Text("Fresh items everyday",
          style: TextStyle(fontSize: 20)
          ),

          SizedBox(height: 80),

          //get started button

          OutlinedButton(
            
            style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.all(20)),
              backgroundColor: WidgetStateProperty.all(Colors.grey[300])),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            },
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
