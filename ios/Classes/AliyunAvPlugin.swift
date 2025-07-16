import Flutter
import UIKit

public class AliyunAvPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "aliyun_av_plugin", binaryMessenger: registrar.messenger())
    let instance = AliyunAvPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "startCall":
      // let args = call.arguments as? [String: Any]
      // TODO: 调用 AliVCSDK_ARTC/ARTCAICallKit 启动音视频通话
      result(true)
    case "queryAgentStatus":
      // let args = call.arguments as? [String: Any]
      // TODO: 查询智能体状态
      result("online")
    case "showRealtimeSubtitle":
      // let args = call.arguments as? [String: Any]
      // TODO: 实时字幕显示
      result("实时字幕内容")
    case "interruptAgent":
      // let args = call.arguments as? [String: Any]
      // TODO: 打断智能体讲话
      result(true)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}