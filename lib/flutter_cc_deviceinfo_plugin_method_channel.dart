import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_cc_deviceinfo_plugin_platform_interface.dart';

/// An implementation of [FlutterCcDeviceinfoPluginPlatform] that uses method channels.
class MethodChannelFlutterCcDeviceinfoPlugin
    extends FlutterCcDeviceinfoPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_cc_deviceinfo_plugin');

  @override
  Future<String?> getAESUtil(String data, String key) async {
    final version = await methodChannel
        .invokeMethod<String>('getAESUtil', {"data": data, "key": key});
    return version;
  }

  @override
  Future<String?> setGzip(String data) async {
    final version = await methodChannel.invokeMethod<String>('setGzip', {
      "data": data,
    });
    return version;
  }

  @override
  Future<Map<dynamic, dynamic>?> getGeneralData() async {
    final data = await methodChannel
        .invokeMethod<Map<dynamic, dynamic>>('getGeneralData');
    return data;
  }

  @override
  Future<Map<dynamic, dynamic>?> getHardwareData() async {
    final data = await methodChannel
        .invokeMethod<Map<dynamic, dynamic>>('getHardwareData');
    return data;
  }

  @override
  Future<Map<dynamic, dynamic>?> getSimCardInfo() async {
    final data = await methodChannel
        .invokeMethod<Map<dynamic, dynamic>>('getSimCardInfo');
    return data;
  }

  @override
  Future<Map<dynamic, dynamic>?> getStorageData() async {
    final version = await methodChannel
        .invokeMethod<Map<dynamic, dynamic>>('getStorageData');
    return version;
  }

  @override
  Future<Map<dynamic, dynamic>?> getOtherData() async {
    final version = await methodChannel.invokeMethod<Map<dynamic, dynamic>>(
      'getOtherData',
    );
    return version;
  }

  @override
  Future<Map<dynamic, dynamic>?> getMediaFilesData() async {
    final version = await methodChannel
        .invokeMethod<Map<dynamic, dynamic>>('getMediaFilesData');
    return version;
  }
}
