import 'package:flutter/services.dart';

class AndroidChannel {
  static const _methodChannel =
      MethodChannel('com.example.app_method_channel/device_info');
  String? _deviceModel;
  String? _batteryLevel;
  String? get batteryLevel => _batteryLevel;
  String? get deviceModel => _deviceModel;
  getDeviceModel() async {
    try {
      _deviceModel = await _methodChannel.invokeMethod('device_model');
    } on PlatformException catch (e) {
      throw e.toString();
    }
  }

  getBatteryLevel() async {
    try {
      _batteryLevel = await _methodChannel.invokeMethod('battery_level');
    } on PlatformException catch (e) {
      throw e.toString();
    }
  }
}
