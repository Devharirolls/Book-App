import 'package:collegeproject/semester5.dart';
import 'package:collegeproject/semester6.dart';
import 'package:collegeproject/semester7.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'welcomescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug:
          true // optional: set to false to disable printing logs to console (default: true)
      // ignoreSsl: true // option: set to false to disable working with http links (default: false)
      );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //ignore_for_file: prefer_const_constructors
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Semester5Screen.id: (context) => Semester5Screen(),
        Semester6Screen.id: (context) => Semester6Screen(),
        Semester7Screen.id: (context) => Semester7Screen(),
      },
      debugShowCheckedModeBanner: false,
      home: StartingApp(),
    );
  }
}

class StartingApp extends StatefulWidget {
  const StartingApp({Key? key}) : super(key: key);

  @override
  State<StartingApp> createState() => _StartingAppState();
}

class _StartingAppState extends State<StartingApp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        // ignore: avoid_unnecessary_containers

        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [Colors.red, Colors.blue]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 75.0,
                backgroundImage: AssetImage('images/eagle.png.jpg'),
              ),
              // Image(
              //   image: AssetImage('images/eagle.png.jpg'),
              //   width: 300.0,
              // ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'CSE NOTES',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50.0,
              ),
              SpinKitFadingCircle(
                color: Colors.orangeAccent,
                size: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
