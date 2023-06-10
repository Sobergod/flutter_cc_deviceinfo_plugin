import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_cc_deviceinfo_plugin/flutter_cc_deviceinfo_plugin_method_channel.dart';

void main() {
  MethodChannelFlutterCcDeviceinfoPlugin platform = MethodChannelFlutterCcDeviceinfoPlugin();
  const MethodChannel channel = MethodChannel('flutter_cc_deviceinfo_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
