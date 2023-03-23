import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mediapipe_task_text/mediapipe_task_text_method_channel.dart';

void main() {
  MethodChannelMediapipeTaskText platform = MethodChannelMediapipeTaskText();
  const MethodChannel channel = MethodChannel('mediapipe_task_text');

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
