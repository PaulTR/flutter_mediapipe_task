import 'package:flutter_test/flutter_test.dart';
import 'package:mediapipe_task_vision/mediapipe_task_vision.dart';
import 'package:mediapipe_task_vision/mediapipe_task_vision_platform_interface.dart';
import 'package:mediapipe_task_vision/mediapipe_task_vision_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMediapipeTaskVisionPlatform
    with MockPlatformInterfaceMixin
    implements MediapipeTaskVisionPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MediapipeTaskVisionPlatform initialPlatform = MediapipeTaskVisionPlatform.instance;

  test('$MethodChannelMediapipeTaskVision is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMediapipeTaskVision>());
  });

  test('getPlatformVersion', () async {
    MediapipeTaskVision mediapipeTaskVisionPlugin = MediapipeTaskVision();
    MockMediapipeTaskVisionPlatform fakePlatform = MockMediapipeTaskVisionPlatform();
    MediapipeTaskVisionPlatform.instance = fakePlatform;

    expect(await mediapipeTaskVisionPlugin.getPlatformVersion(), '42');
  });
}
