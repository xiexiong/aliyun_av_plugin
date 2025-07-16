package com.example.aliyun_av_plugin

import android.app.Activity
import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import com.szxm.av.AUIAICallInCallController

class AliyunAvPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null
    private lateinit var appContext: Context

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        appContext = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "aliyun_av_plugin")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        try {
            when (call.method) {
                "callVoiceAgent" -> {
                    val userId = call.argument<String>("UserId")
                    val loginAuthor = call.argument<String>("loginAuthorization")
                    if (userId != null && loginAuthor != null) {
                        AUIAICallInCallController.initialize(appContext)
                        AUIAICallInCallController.getInstance().callVoiceAgent(userId, loginAuthor)
                        result.success(true)
                    } else {
                        result.error("INVALID_ARGUMENTS", "UserId or loginAuthorization is null", null)
                    }
                }
                "callViodeAgent" -> {
                    val userId = call.argument<String>("UserId")
                    val loginAuthor = call.argument<String>("loginAuthorization")
                    if (userId != null && loginAuthor != null) {
                        AUIAICallInCallController.initialize(appContext)
                        AUIAICallInCallController.getInstance().callViodeAgent(userId, loginAuthor)
                        result.success(true)
                    } else {
                        result.error("INVALID_ARGUMENTS", "UserId or loginAuthorization is null", null)
                    }
                }
                else -> result.notImplemented()
            }
        } catch (e: Exception) {
            result.error("PLUGIN_ERROR", e.message, null)
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }
}