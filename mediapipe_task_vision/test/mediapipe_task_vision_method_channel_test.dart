import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mediapipe_task_vision/mediapipe_task_vision_method_channel.dart';

void main() {
  MethodChannelMediapipeTaskVision platform = MethodChannelMediapipeTaskVision();
  const MethodChannel channel = MethodChannel('mediapipe_task_vision');

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
