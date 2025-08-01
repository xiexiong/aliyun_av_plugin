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
//      guard let args = call.arguments as? [String: Any],
//            let type = args["agentType"] as? String else {
//          result(false)
//          return
//      }

     
  
      AUIAICallManager.defaultManager.startCall(callArgs: call.arguments as! Dictionary<String, Any>) {
          AliyunAvPlugin.channel?.invokeMethod("onSubtitleUpdate", arguments: nil)
      }
      result(true)
  }
}
