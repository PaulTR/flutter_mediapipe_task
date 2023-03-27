package org.tensorflow.mediapipe.task.mediapipe_task_text

import android.content.Context
import com.google.mediapipe.tasks.core.BaseOptions
import com.google.mediapipe.tasks.text.textclassifier.TextClassifier
import com.google.mediapipe.tasks.text.textclassifier.TextClassifierResult

class TextClassifierHelper(
    var currentModel: String,
    val context: Context,
) {
    private lateinit var textClassifier: TextClassifier

    init {
        initClassifier()
    }

    fun initClassifier() {
        val baseOptionsBuilder = BaseOptions.builder()
            .setModelAssetPath("model.tflite")

        val baseOptions = baseOptionsBuilder.build()
        val optionsBuilder = TextClassifier.TextClassifierOptions.builder()
            .setBaseOptions(baseOptions)
        val options = optionsBuilder.build()
        textClassifier = TextClassifier.createFromOptions(context, options)
    }

    // Run text classification using MediaPipe Text Classifier API
    fun classify(text: String) : TextClassifierResult {
        return textClassifier.classify(text)
    }
}