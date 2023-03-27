import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mediapipe_task_text_platform_interface.dart';

/// An implementation of [MediapipeTaskTextPlatform] that uses method channels.
class MethodChannelMediapipeTaskText extends MediapipeTaskTextPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mediapipe_task_text');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> classify(String text) async {
    String? classification = await methodChannel.invokeMethod<String>('classify', <String, String> {
      'text': text
    });

    return classification;
  }

  @override
  Future<void> initClassifier(String modelPath) async {
    // TODO Update this to return a result
    await methodChannel.invokeMethod<String>('initClassifier', <String, String> {
      'modelPath': modelPath
    });
  }
}
