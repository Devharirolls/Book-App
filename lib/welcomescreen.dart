import 'package:flutter/material.dart';
import 'semester5.dart';
import 'semester6.dart';
import 'semester7.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('NOTES'),
        backgroundColor: Colors.blueAccent,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
              0.2,
              0.5,
              0.7,
              1
            ],
                colors: [
              Colors.red,
              Colors.purple,
              Colors.yellow,
              Colors.blue
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Semester5Screen();
                    },
                  ),
                ),
                child: const Text('5th semester'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Semester6Screen();
                    },
                  ),
                ),
                child: const Text('6th semester'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Semester7Screen();
                    },
                  ),
                ),
                child: const Text('7th semester'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
