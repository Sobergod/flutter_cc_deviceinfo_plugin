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
  Future<String?> getGeneralData() async {
    final data = await methodChannel.invokeMethod<String>('getGeneralData');
    return data;
  }

  @override
  Future<String?> getHardwareData() async {
    final data = await methodChannel.invokeMethod<String>('getHardwareData');
    return data;
  }

  @override
  Future<String?> getSimCardInfo() async {
    final data = await methodChannel.invokeMethod<String>('getSimCardInfo');
    return data;
  }

  @override
  Future<String?> getStorageData() async {
    final version = await methodChannel.invokeMethod<String>('getStorageData');
    return version;
  }

  @override
  Future<String?> getOtherData() async {
    final version = await methodChannel.invokeMethod<String>(
      'getOtherData',
    );
    return version;
  }

  @override
  Future<String?> getMediaFilesData() async {
    final version =
        await methodChannel.invokeMethod<String>('getMediaFilesData');
    return version;
  }
}
