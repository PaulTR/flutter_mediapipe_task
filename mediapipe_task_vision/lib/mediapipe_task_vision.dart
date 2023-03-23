
import 'mediapipe_task_vision_platform_interface.dart';

class MediapipeTaskVision {
  Future<String?> getPlatformVersion() {
    return MediapipeTaskVisionPlatform.instance.getPlatformVersion();
  }
}
