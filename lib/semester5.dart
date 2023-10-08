import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Semester5Screen extends StatefulWidget {
  static const String id = 'Semester5';

  const Semester5Screen({Key? key}) : super(key: key);

  @override
  State<Semester5Screen> createState() => _Semester5ScreenState();
}

class _Semester5ScreenState extends State<Semester5Screen> {
  int progress = 0;

  final ReceivePort _receivePort = ReceivePort();

  static downloadingcallback(id, status, progress) {
    SendPort? sendport = IsolateNameServer.lookupPortByName('downloading');
    sendport?.send([id, status, progress]);
  }

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, 'downloading');

    _receivePort.listen((message) {
      if (mounted) {
        setState(() {
          // ignore: void_checks
          return progress = message[2];
        });
      }

      // ignore: avoid_print
      print(progress);
    });

    FlutterDownloader.registerCallback(downloadingcallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloading');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('SEMESTER 5'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/yellow.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$progress % Downloading",
                style: const TextStyle(
                  fontSize: 40.0,
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.storage.request();

                    if (status.isGranted) {
                      final externalDir = await getExternalStorageDirectory();

                      FlutterDownloader.enqueue(
                          url:
                              "https://firebasestorage.googleapis.com/v0/b/flash-chat-67724.appspot.com/o/CSENOTES%2FCS8591-CN_compressed.pdf?alt=media&token=7d3ec06a-9e0b-4634-91a2-9b091282dd98",
                          savedDir: externalDir!.path,
                          fileName: 'CN 8591',
                          showNotification: true,
                          openFileFromNotification: true);
                    } else {
                      // ignore: avoid_print
                      print('permission is denied');
                    }
                  },
                  child: const Text('  CN-8591  ')),
              const SizedBox(
                width: 15.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  final status = await Permission.storage.request();

                  if (status.isGranted) {
                    final externalDir = await getExternalStorageDirectory();

                    FlutterDownloader.enqueue(
                        url:
                            "https://firebasestorage.googleapis.com/v0/b/flash-chat-67724.appspot.com/o/CSENOTES%2FCS8501%20-%20Theory%20of%20Computation.pdf?alt=media&token=f4282bed-f80c-4035-a30e-55ec3398a40f",
                        savedDir: externalDir!.path,
                        fileName: 'TOC CS8501',
                        showNotification: true,
                        openFileFromNotification: true);
                  } else {
                    // ignore: avoid_print
                    print('permission is denied');
                  }
                },
                child: const Text('TOC-CS8501'),
              ),
              const SizedBox(
                width: 15.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.storage.request();

                    if (status.isGranted) {
                      final externalDir = await getExternalStorageDirectory();

                      FlutterDownloader.enqueue(
                          url:
                              "https://firebasestorage.googleapis.com/v0/b/flash-chat-67724.appspot.com/o/CSENOTES%2FCS8592%20-%20Object%20Oriented%20Analysis%20and%20Design.pdf?alt=media&token=29205e88-31ad-448a-98e0-2966e16f35b9",
                          savedDir: externalDir!.path,
                          fileName: 'OOAD CS8592',
                          showNotification: true,
                          openFileFromNotification: true);
                    } else {
                      // ignore: avoid_print
                      print('permission is denied');
                    }
                  },
                  child: const Text('OOAD CS8592')),
              const SizedBox(
                width: 15.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.storage.request();

                    if (status.isGranted) {
                      final externalDir = await getExternalStorageDirectory();

                      FlutterDownloader.enqueue(
                          url:
                              "https://firebasestorage.googleapis.com/v0/b/flash-chat-67724.appspot.com/o/CSENOTES%2FEC8691%20-%20Microprocessors%20and%20Microcontrollers_compressed.pdf?alt=media&token=effced20-7697-4819-b2df-2f57aabb66fd",
                          savedDir: externalDir!.path,
                          fileName: 'MPMC EC8691',
                          showNotification: true,
                          openFileFromNotification: true);
                    } else {
                      // ignore: avoid_print
                      print('permission is denied');
                    }
                  },
                  child: const Text('MPMC EC8691')),
            ],
          ),
        ),
      ),
    );
  }
}
