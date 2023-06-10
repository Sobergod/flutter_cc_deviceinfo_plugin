import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_cc_deviceinfo_plugin_method_channel.dart';

abstract class FlutterCcDeviceinfoPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterCcDeviceinfoPluginPlatform.
  FlutterCcDeviceinfoPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterCcDeviceinfoPluginPlatform _instance =
      MethodChannelFlutterCcDeviceinfoPlugin();

  /// The default instance of [FlutterCcDeviceinfoPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterCcDeviceinfoPlugin].
  static FlutterCcDeviceinfoPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterCcDeviceinfoPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterCcDeviceinfoPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getAESUtil(String data, String key) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> setGzip(String data) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getGeneralData() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getHardwareData() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getSimCardInfo() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getStorageData() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getOtherData() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getMediaFilesData() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
