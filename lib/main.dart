import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pidrone/controllerpage.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:async';

List<int> joyStickData = [0,0,0,0];

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // print(name);
  const oneSec = Duration(milliseconds: 50);

  Timer.periodic(oneSec, (Timer timer) {
    // print(joyStickData);
     });
}

double battLowVolatage = 2.50;
String ipaddress = '192.168.4.1';
// final ipaddress = Uri.parse('192.168.4.1') ;
final channel = IOWebSocketChannel.connect("ws://$ipaddress:81/");

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ControllerPage(
        channel: channel,
        joyStickData : joyStickData,
      ),
    );
  }
}
