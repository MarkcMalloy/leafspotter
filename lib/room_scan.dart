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
      MethodChannel channel =
          const MethodChannel("com.nativeActivity/iosChannel");
      print("Calling start native:");
      channel.invokeMethod('StartNativeIOS');
      await Future.delayed(Duration(seconds: 3));
      channel.invokeMethod('StopNativeIOS');
    } on PlatformException catch (e) {}

    setState(() {
      showView = !showView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: showView,
              child: roomScanner(),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.greenAccent)),
                  onPressed: () async {
                    await initializeScanner();
                  },
                  child: const Text(
                    "Scan Room",
                    style: TextStyle(fontSize: 22),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget roomScanner() {
    return NativeRoomPlanView();
  }
}
