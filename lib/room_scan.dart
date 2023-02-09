import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:leafspotter/lidar/roomplan_native_view.dart';

class RoomScanPage extends StatefulWidget {
  const RoomScanPage({Key? key}) : super(key: key);

  @override
  State<RoomScanPage> createState() => _RoomScanPageState();
}

class _RoomScanPageState extends State<RoomScanPage> {
  bool showView = false;
  Future<void> initializeScanner() async {
    try {
      MethodChannel channel = new MethodChannel("com.nativeActivity/iosChannel");
      print("result:");
      final int result = await channel.invokeMethod('StartNativeIOS');
      print(" $result");
    } on PlatformException catch (e) {}

    setState(() {
      showView = !showView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Visibility(
            child: roomScanner(),
            visible: showView,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Colors.greenAccent)),
                    onPressed: () async {
                      await initializeScanner();
                    },
                    child: const Text("Scan Room", style: TextStyle(fontSize: 22),)),
              )
            ],
          ),
        ],
      )),
    );
  }

  Widget roomScanner() {
    return NativeRoomPlanView();
  }
}
