import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Text('Welcome to the home page!'),
          ElevatedButton(
            onPressed: () {
              // Add your button onPressed logic here
            },
            child: Text('Click me'),
          ),
        ],
      ),
    );
  }
}