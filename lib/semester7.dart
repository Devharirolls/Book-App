// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:isolate';
import 'dart:ui';

class Semester7Screen extends StatefulWidget {
  static const String id = 'Semester7';

  const Semester7Screen({Key? key}) : super(key: key);

  @override
  State<Semester7Screen> createState() => _Semester7ScreenState();
}

class _Semester7ScreenState extends State<Semester7Screen> {
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
      setState(() {
        return progress = message[2];
      });

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
        backgroundColor: Colors.yellowAccent,
        title: const Text(
          'SEMESTER 7',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/blue.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$progress % Downloading",
                style: const TextStyle(fontSize: 40.0),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.storage.request();

                    if (status.isGranted) {
                      final externalDir = await getExternalStorageDirectory();

                      FlutterDownloader.enqueue(
                          url:
                              "https://firebasestorage.googleapis.com/v0/b/flash-chat-67724.appspot.com/o/CSENOTES%2FMG8591%20-%20Principles%20of%20Management_compressed.pdf?alt=media&token=fec103ff-fbd7-435b-944d-3377f3a33708",
                          savedDir: externalDir!.path,
                          fileName: 'PM 8591',
                          showNotification: true,
                          openFileFromNotification: true);
                    } else {
                      // ignore: avoid_print
                      print('permission is denied');
                    }
                  },
                  child: const Text('PM 8591')),
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
                            "https://firebasestorage.googleapis.com/v0/b/flash-chat-67724.appspot.com/o/CSENOTES%2FCS8792%20-%20Cryptography%20%26%20Network%20Security_compressed.pdf?alt=media&token=75c785d7-f4c9-4888-8c48-94ec9ca8ffdd",
                        savedDir: externalDir!.path,
                        fileName: 'CNS 8792',
                        showNotification: true,
                        openFileFromNotification: true);
                  } else {
                    // ignore: avoid_print
                    print('permission is denied');
                  }
                },
                child: const Text('CNS 8792'),
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
                              "https://firebasestorage.googleapis.com/v0/b/flash-chat-67724.appspot.com/o/CSENOTES%2FCS8791%20-%20Cloud%20Computing_compressed.pdf?alt=media&token=ba4071dd-57dc-40b2-b9ab-da7160ff266f",
                          savedDir: externalDir!.path,
                          fileName: 'CC 8791',
                          showNotification: true,
                          openFileFromNotification: true);
                    } else {
                      // ignore: avoid_print
                      print('permission is denied');
                    }
                  },
                  child: const Text('CC 8791')),
            ],
          ),
        ),
      ),
    );
  }
}
