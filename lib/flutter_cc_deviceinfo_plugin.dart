import 'flutter_cc_deviceinfo_plugin_platform_interface.dart';

class FlutterCcDeviceinfoPlugin {
  Future<String?> getAESUtil(String data, String key) {
    return FlutterCcDeviceinfoPluginPlatform.instance.getAESUtil(data, key);
  }

  Future<String?> setGzip(String data) {
    return FlutterCcDeviceinfoPluginPlatform.instance.setGzip(data);
  }

  Future<Map<dynamic, dynamic>?> getGeneralData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getGeneralData();
  }

  Future<Map<dynamic, dynamic>?> getHardwareData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getHardwareData();
  }

  Future<Map<dynamic, dynamic>?> getSimCardInfo() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getSimCardInfo();
  }

  Future<Map<dynamic, dynamic>?> getStorageData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getStorageData();
  }

  Future<Map<dynamic, dynamic>?> getOtherData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getOtherData();
  }

  Future<Map<dynamic, dynamic>?> getMediaFilesData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getMediaFilesData();
  }

  Future<Map<dynamic, dynamic>?> getBatteryStatusData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getBatteryStatusData();
  }

  Future<Map<dynamic, dynamic>?> getNetWorkData() {
    return FlutterCcDeviceinfoPluginPlatform.instance.getNetWorkData();
  }
}
