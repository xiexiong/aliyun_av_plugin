import Flutter
import AUIAICall
import UIKit

public class AliyunAvPlugin: NSObject, FlutterPlugin {
  private static var channel: FlutterMethodChannel?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "aliyun_av_plugin", binaryMessenger: registrar.messenger())
    AliyunAvPlugin.channel = channel
    let instance = AliyunAvPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    AUIAICallManager.defaultManager.startCall(callArgs: call.arguments as! Dictionary<String, Any>) {
        AliyunAvPlugin.channel?.invokeMethod("onSubtitleUpdate", arguments: nil)
    }
    result(true)
  }
}
