import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goob_by_me/app/application.dart';
import 'package:logging/logging.dart';
// import 'package:device_preview/device_preview.dart';
import 'core/observers/bloc_observer_extend.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  // BlocObserver
  Bloc.observer = BlocObserverExtend();
  runApp(Application());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => Application(), // Wrap your app
  //   ),
  // );
}
