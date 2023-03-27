
import 'mediapipe_task_text_platform_interface.dart';

class MediapipeTaskText {
  Future<String?> getPlatformVersion() {
    return MediapipeTaskTextPlatform.instance.getPlatformVersion();
  }

  Future<String?> classify(String text) {
    return MediapipeTaskTextPlatform.instance.classify(text);
  }

  Future<void> initClassifier(String modelPath) {
    return MediapipeTaskTextPlatform.instance.initClassifier(modelPath);
  }
}
