// importing flutter and dart packages
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

// Creates a Material App
void main() => runApp(
       MaterialApp(
        home: BallPage(),
      ),
    );

// Creates a Scaffold with
// appbar using Stateless widget
class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        title: const Text('Magic 8-Ball'),
      ),
      body: Ball(key: UniqueKey()),
    );
  }
}

// Creates a Stateful widget
class Ball extends StatefulWidget {
  const Ball({required Key key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  @override
  void didChangeDependencies() {
    // Adjust the provider based on the image type
    precacheImage( const AssetImage('images/ball1.png'),  context);
    precacheImage( const AssetImage('images/ball2.png'),  context);
    precacheImage( const AssetImage('images/ball3.png'),  context);
    precacheImage( const AssetImage('images/ball4.png'),  context);
    precacheImage( const AssetImage('images/ball5.png'),  context);
    super.didChangeDependencies();
  }
// Returns app with centered image Flatbutton
  Widget build(BuildContext context) {

    return Center(
      child: TextButton(
        style: ButtonStyle(overlayColor: MaterialStateProperty.all<Color>(Colors.transparent)),
        onPressed: () {
          setState(() {
            // Random.nextInt(n) returns random
            // integer from 0 to n-1
            ballNumber = Random().nextInt(5) + 1;
          });
        },
        onHover: (hovering) {
          print(hovering);
        },

        // Adding images
        child: Image.asset('images/ball$ballNumber.png' ),
      ),
    );
  }
}
