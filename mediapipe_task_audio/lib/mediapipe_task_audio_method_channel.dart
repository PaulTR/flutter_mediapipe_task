import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mediapipe_task_audio_platform_interface.dart';

/// An implementation of [MediapipeTaskAudioPlatform] that uses method channels.
class MethodChannelMediapipeTaskAudio extends MediapipeTaskAudioPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mediapipe_task_audio');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
