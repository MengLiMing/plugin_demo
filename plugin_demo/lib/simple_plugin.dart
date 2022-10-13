import 'package:flutter/services.dart';

class SimplePlugin {
  late MethodChannel _channel = MethodChannel('flutter_simple_channel');

  static SimplePlugin instance = SimplePlugin._();

  SimplePlugin._() {
    _channel.setMethodCallHandler((call) async {
      print(call.method);
      print(call.arguments);
    });
  }

  Future<String> method() async {
    return _channel.invokeMethod('method').then((value) => value);
  }

  Future<String> methodWithAruguments(String arg) {
    return _channel
        .invokeMethod('methodWithAruguments', arg)
        .then((value) => value);
  }

  Future<String> closureMethod() {
    return _channel.invokeMethod('closureMethod').then((value) => value);
  }
}
