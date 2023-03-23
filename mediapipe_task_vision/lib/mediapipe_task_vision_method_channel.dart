import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mediapipe_task_vision_platform_interface.dart';

/// An implementation of [MediapipeTaskVisionPlatform] that uses method channels.
class MethodChannelMediapipeTaskVision extends MediapipeTaskVisionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mediapipe_task_vision');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
