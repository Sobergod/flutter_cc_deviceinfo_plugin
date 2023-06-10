import 'flutter_cc_deviceinfo_plugin_platform_interface.dart';

class FlutterCcDeviceinfoPlugin {
  Future<String?> getAESUtil(String data, String key) {
    return FlutterCcDeviceinfoPluginPlatform.instance.getAESUtil(data, key);
  }

  Future<String?> setGzip(String data, String key) {
    return FlutterCcDeviceinfoPluginPlatform.instance.getAESUtil(data, key);
  }

  Future<String?> getGeneralData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getGeneralData();
  }

  Future<String?> getHardwareData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getHardwareData();
  }

  Future<String?> getSimCardInfo() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getSimCardInfo();
  }

  Future<String?> getStorageData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getStorageData();
  }

  Future<String?> getOtherData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getOtherData();
  }

  Future<String?> getMediaFilesData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getMediaFilesData();
  }
}
