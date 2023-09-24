import 'package:logger/logger.dart';

Logger _logger = Logger();

class AppLogger {
  static void log(
    dynamic message, {
    LogType logType = LogType.debug,
    dynamic error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _logger.log(_logTypeToLogLevel(logType), message,
        error: error, stackTrace: stackTrace, time: time);
  }

  static void errorLog(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    _logger.log(Level.error, message,
        error: error, stackTrace: stackTrace, time: time);
  }

  static Level _logTypeToLogLevel(LogType logType) {
    switch (logType) {
      case LogType.trace:
        return Level.trace;
      case LogType.debug:
        return Level.debug;
      case LogType.info:
        return Level.info;
      case LogType.warning:
        return Level.warning;
      case LogType.error:
        return Level.error;
      case LogType.fatal:
        return Level.fatal;
      case LogType.off:
        return Level.off;
    }
  }
}

enum LogType {
  trace,
  debug,
  info,
  warning,
  error,
  fatal,
  off,
}
