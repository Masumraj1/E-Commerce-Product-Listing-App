import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/app/global/helper/device_utils/device_utils.dart';

import 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DeviceUtils.lockDevicePortrait();
  runApp(
    //   DevicePreview(
    // enabled: !kReleaseMode,
    // builder: (context) => const MyApp(), // Wrap your app
    // ));

      const MyApp());
}




