import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const batteryChannel = MethodChannel('battery');
  String batteryLevel = 'wait';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(batteryLevel),
            ElevatedButton(
              onPressed: getBatteryLevel,
              child: Text('Click'),
            ),
          ],
        ),
      ),
    ));
  }

  Future getBatteryLevel() async {
    final int newBatteryLevel =
        await batteryChannel.invokeMethod("getBatteryLevel");
    setState(() {
      batteryLevel = '$newBatteryLevel';
    });
  }
}
