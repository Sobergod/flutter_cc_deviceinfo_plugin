import 'flutter_cc_deviceinfo_plugin_platform_interface.dart';

class FlutterCcDeviceinfoPlugin {
  Future<String?> getAESUtil(String data, String key) {
    return FlutterCcDeviceinfoPluginPlatform.instance.getAESUtil(data, key);
  }

  Future<String?> setGzip(String data, String key) {
    return FlutterCcDeviceinfoPluginPlatform.instance.getAESUtil(data, key);
  }
}
