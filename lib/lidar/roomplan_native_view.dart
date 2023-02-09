import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeRoomPlanView extends StatelessWidget {
  const NativeRoomPlanView({Key? key}) : super(key: key);
  // TODO: MAKE THIS WORK -> https://docs.flutter.dev/development/platform-integration/ios/platform-views

  @override
  Widget build(BuildContext context) {
/*
    // This is used in the platform side to register the view.
    const String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};
 */

    return const SizedBox(
      height: 380,
      width: 380,
      child: UiKitView(
        //viewType: viewType,
        viewType: 'NativeView',
        layoutDirection: TextDirection.ltr,
        //creationParams: creationParams,
        creationParamsCodec: StandardMessageCodec(),
      ),
    );
  }
}
