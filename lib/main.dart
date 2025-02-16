import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String? deviceModel;
  String? osVersion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Device Info"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Device Model: $deviceModel"),
                Text("OS Version: $osVersion"),
                OutlinedButton(
                    onPressed: () async{
                      var deviceInfo = await deviceInfoPlugin.deviceInfo;
                      setState(() {
                        deviceModel = deviceInfo.data["product"];
                        osVersion = deviceInfo.data["version"]["release"];
                      });
                    },
                    child: Text("Get Info")
                )
              ],
            ),
          )
      ),
    );
  }
}

