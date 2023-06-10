import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_cc_deviceinfo_plugin/flutter_cc_deviceinfo_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterCcDeviceinfoPlugin = FlutterCcDeviceinfoPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _flutterCcDeviceinfoPlugin.getAESUtil(
              "123", 'eb85317b657f3ab2520ebbed3903166d') ??
          'Unknown platform version';
      Map<dynamic, dynamic>? a =
          await _flutterCcDeviceinfoPlugin.getHardwareData();
      Map<dynamic, dynamic>? a1 =
          await _flutterCcDeviceinfoPlugin.getGeneralData();
      Map<dynamic, dynamic>? a2 =
          await _flutterCcDeviceinfoPlugin.getMediaFilesData();
      Map<dynamic, dynamic>? a3 =
          await _flutterCcDeviceinfoPlugin.getOtherData();
      Map<dynamic, dynamic>? a4 =
          await _flutterCcDeviceinfoPlugin.getSimCardInfo();
      Map<dynamic, dynamic>? a5 =
          await _flutterCcDeviceinfoPlugin.getStorageData();
      print(a);
      print(a1);
      print(a2);
      print(a3);
      print(a4);
      print(a5);
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
