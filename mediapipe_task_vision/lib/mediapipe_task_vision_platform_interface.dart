import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mediapipe_task_vision_method_channel.dart';

abstract class MediapipeTaskVisionPlatform extends PlatformInterface {
  /// Constructs a MediapipeTaskVisionPlatform.
  MediapipeTaskVisionPlatform() : super(token: _token);

  static final Object _token = Object();

  static MediapipeTaskVisionPlatform _instance = MethodChannelMediapipeTaskVision();

  /// The default instance of [MediapipeTaskVisionPlatform] to use.
  ///
  /// Defaults to [MethodChannelMediapipeTaskVision].
  static MediapipeTaskVisionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MediapipeTaskVisionPlatform] when
  /// they register themselves.
  static set instance(MediapipeTaskVisionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
