import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mediapipe_task_audio/mediapipe_task_audio_method_channel.dart';

void main() {
  MethodChannelMediapipeTaskAudio platform = MethodChannelMediapipeTaskAudio();
  const MethodChannel channel = MethodChannel('mediapipe_task_audio');

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
