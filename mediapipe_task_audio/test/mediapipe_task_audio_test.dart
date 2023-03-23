import 'package:flutter_test/flutter_test.dart';
import 'package:mediapipe_task_audio/mediapipe_task_audio.dart';
import 'package:mediapipe_task_audio/mediapipe_task_audio_platform_interface.dart';
import 'package:mediapipe_task_audio/mediapipe_task_audio_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMediapipeTaskAudioPlatform
    with MockPlatformInterfaceMixin
    implements MediapipeTaskAudioPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MediapipeTaskAudioPlatform initialPlatform = MediapipeTaskAudioPlatform.instance;

  test('$MethodChannelMediapipeTaskAudio is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMediapipeTaskAudio>());
  });

  test('getPlatformVersion', () async {
    MediapipeTaskAudio mediapipeTaskAudioPlugin = MediapipeTaskAudio();
    MockMediapipeTaskAudioPlatform fakePlatform = MockMediapipeTaskAudioPlatform();
    MediapipeTaskAudioPlatform.instance = fakePlatform;

    expect(await mediapipeTaskAudioPlugin.getPlatformVersion(), '42');
  });
}
