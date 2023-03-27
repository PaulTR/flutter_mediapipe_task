package org.tensorflow.mediapipe.task.mediapipe_task_text

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import com.google.mediapipe.tasks.text.textclassifier.TextClassifierResult

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** MediapipeTaskTextPlugin */
class MediapipeTaskTextPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private lateinit var activity: Activity

  private lateinit var textClassifierHelper: TextClassifierHelper

  override fun onDetachedFromActivity() {}

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {}

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "mediapipe_task_text")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if( call.method == "initClassifier" ) {
//      if( !call.hasArgument("modelPath")) {
//        result.error("Missing Model",
//          "Model missing",
//          "Must include model name to initialize Classifier")
//      }
      textClassifierHelper = TextClassifierHelper(currentModel = call.argument("modelPath")!!, context = context);
    }
    else if( call.method == "classify" ) {
      // TODO Check if classifier is initialized, otherwise throw exception
      val results = textClassifierHelper.classify(call.argument("text") ?: "")
      val item = results.classificationResult().classifications()[0].categories()[0]
      result.success(item.categoryName() + " " + item.score())
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
