import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:isolate';
import 'dart:ui';

class Semester6Screen extends StatefulWidget {
  static const String id = 'Semester6';

  const Semester6Screen({Key? key}) : super(key: key);

  @override
  State<Semester6Screen> createState() => _Semester6ScreenState();
}

class _Semester6ScreenState extends State<Semester6Screen> {
  int progress = 0;

  final ReceivePort _receivePort = ReceivePort();

  static downloadingcallback(id, status, progress) {
    SendPort? sendport = IsolateNameServer.lookupPortByName('download');
    sendport?.send([id, status, progress]);
  }

  @override
  void initState() {
    super.initState();

    IsolateNameServer.registerPortWithName(_receivePort.sendPort, 'download');

    _receivePort.listen((message) {
      if (mounted) {
        setState(() {
          progress = message[2];
        });
      }

      // ignore: avoid_print
      print(progress);
    });

    FlutterDownloader.registerCallback(downloadingcallback);
  }

  // @override
  // void dispose() {
  //   IsolateNameServer.removePortNameMapping('download');
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('SEMESTER 6'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/color.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$progress % Downloading",
                style: const TextStyle(fontSize: 40.0, color: Colors.white),
              ),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final status = await Permission.storage.request();

                    if (status.isGranted) {
                      final externalDir = await getExternalStorageDirectory();

                      FlutterDownloader.enqueue(
                          url:
                              "https://firebasestorage.googleapis.com/v0/b/flash-chat-67724.appspot.com/o/CSENOTES%2FCS8691%20-%20Artificial%20Intelligence_compressed.pdf?alt=media&token=ee2a4195-92ad-4ab4-9a34-f5d690ac3f59",
                          savedDir: externalDir!.path,
                          fileName: 'AI 8691',
                          showNotification: true,
                          openFileFromNotification: true);
                    } else {
                      // ignore: avoid_print
                      print('permission is denied');
                    }
                  },
                  child: const Text('AI 8691')),
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
                            "https://firebasestorage.googleapis.com/v0/b/flash-chat-67724.appspot.com/o/CSENOTES%2FCS8601%20-%20Mobile%20Computing_compressed.pdf?alt=media&token=566c6c02-7072-4eec-b72c-c576acf5c592",
                        savedDir: externalDir!.path,
                        fileName: 'MC 8601',
                        showNotification: true,
                        openFileFromNotification: true);
                  } else {
                    // ignore: avoid_print
                    print('permission is denied');
                  }
                },
                child: const Text('MC 8601'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
