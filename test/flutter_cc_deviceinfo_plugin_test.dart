import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cc_deviceinfo_plugin/flutter_cc_deviceinfo_plugin.dart';
import 'package:flutter_cc_deviceinfo_plugin/flutter_cc_deviceinfo_plugin_platform_interface.dart';
import 'package:flutter_cc_deviceinfo_plugin/flutter_cc_deviceinfo_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterCcDeviceinfoPluginPlatform
    with MockPlatformInterfaceMixin
    implements FlutterCcDeviceinfoPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterCcDeviceinfoPluginPlatform initialPlatform = FlutterCcDeviceinfoPluginPlatform.instance;

  test('$MethodChannelFlutterCcDeviceinfoPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterCcDeviceinfoPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterCcDeviceinfoPlugin flutterCcDeviceinfoPlugin = FlutterCcDeviceinfoPlugin();
    MockFlutterCcDeviceinfoPluginPlatform fakePlatform = MockFlutterCcDeviceinfoPluginPlatform();
    FlutterCcDeviceinfoPluginPlatform.instance = fakePlatform;

    expect(await flutterCcDeviceinfoPlugin.getPlatformVersion(), '42');
  });
}
