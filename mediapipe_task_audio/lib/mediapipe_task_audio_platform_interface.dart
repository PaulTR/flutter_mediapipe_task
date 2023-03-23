import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mediapipe_task_audio_method_channel.dart';

abstract class MediapipeTaskAudioPlatform extends PlatformInterface {
  /// Constructs a MediapipeTaskAudioPlatform.
  MediapipeTaskAudioPlatform() : super(token: _token);

  static final Object _token = Object();

  static MediapipeTaskAudioPlatform _instance = MethodChannelMediapipeTaskAudio();

  /// The default instance of [MediapipeTaskAudioPlatform] to use.
  ///
  /// Defaults to [MethodChannelMediapipeTaskAudio].
  static MediapipeTaskAudioPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MediapipeTaskAudioPlatform] when
  /// they register themselves.
  static set instance(MediapipeTaskAudioPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
