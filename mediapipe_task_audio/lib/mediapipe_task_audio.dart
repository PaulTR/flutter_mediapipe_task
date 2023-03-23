
import 'mediapipe_task_audio_platform_interface.dart';

class MediapipeTaskAudio {
  Future<String?> getPlatformVersion() {
    return MediapipeTaskAudioPlatform.instance.getPlatformVersion();
  }
}
