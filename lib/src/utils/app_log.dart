import 'dart:developer';

class AppLog {
  ///This Constructor of `AppLog` take 2 parameters
  ///```dart
  ///final dynamic message //This will be displayed in console
  ///final StackTrace? stackTrace //Optional
  ///```
  ///will be used to log the `message` with `yellow` color.
  ///
  ///It can be used for error logs
  ///
  ///You can use other constructors for different type of logs
  ///eg.
  ///- `AppLog()` - for basic log
  ///- `AppLog.info()` - for info log
  ///- `AppLog.success()` - for success log
  AppLog.error(this.message, [this.stackTrace]) {
    log(
      '\x1B[31m$message\x1B[0m',
      stackTrace: stackTrace, //?? StackTrace.current,
      name: 'Error',
      level: 1200,
    );
  }

  ///This Constructor of `AppLog` take 2 parameters
  ///```dart
  ///final dynamic message //This will be displayed in console
  ///final StackTrace? stackTrace //Optional
  ///```
  ///will be used to log the `message` with `yellow` color.
  ///
  ///It can be used for success logs
  ///
  ///You can use other constructors for different type of logs
  ///eg.
  ///- `AppLog()` - for basic log
  ///- `AppLog.info()` - for info log
  ///- `AppLog.error()` - for error log
  AppLog.success(this.message, [this.stackTrace]) {
    log(
      '\x1B[32m$message\x1B[0m',
      stackTrace: stackTrace,
      name: 'Success',
      level: 800,
    );
  }

  ///This Constructor of `AppLog` take 2 parameters
  ///```dart
  ///final dynamic message //This will be displayed in console
  ///final StackTrace? stackTrace //Optional
  ///```
  ///will be used to log the `message` with `yellow` color.
  ///
  ///It can be used for information logs
  ///
  ///You can use other constructors for different type of logs
  ///eg.
  ///- `AppLog()` - for basic log
  ///- `AppLog.success()` - for success log
  ///- `AppLog.error()` - for error log
  AppLog.info(this.message, [this.stackTrace]) {
    log(
      '\x1B[33m$message\x1B[0m',
      stackTrace: stackTrace,
      name: 'Info',
      level: 900,
    );
  }

  ///This Constructor of `AppLog` take 2 parameters
  ///```dart
  ///final dynamic message //This will be displayed in console
  ///final StackTrace? stackTrace //Optional
  ///```
  ///will be used to log the `message` with `yellow` color.
  ///
  ///It can be used for basic logs
  ///
  ///You can use other constructors for different type of logs
  ///eg.
  ///- `AppLog.info()` - for information log
  ///- `AppLog.success()` - for success log
  ///- `AppLog.error()` - for error log
  AppLog(this.message, [this.stackTrace]) {
    log(
      '\x1B[37m$message\x1B[0m',
      stackTrace: stackTrace,
      level: 700,
    );
  }
  final dynamic message;
  final StackTrace? stackTrace;
}
