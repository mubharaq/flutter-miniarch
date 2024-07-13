import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

Logger logger = Logger('[AppLogger]');
void setupLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    }
    if (record.level == Level.SEVERE) {
      // Sentry.captureException(
      //   record.error,
      //   stackTrace: record.stackTrace,
      // );
    }
  });
}
