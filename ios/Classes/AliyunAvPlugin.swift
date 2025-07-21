import Flutter
import AUIAICall
import UIKit

public class AliyunAvPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "aliyun_av_plugin", binaryMessenger: registrar.messenger())
    let instance = AliyunAvPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "callVoiceAgent":
        AUIAICallManager.defaultManager.startCall(agentType: .VoiceAgent)
      // TODO: 调用 AliVCSDK_ARTC/ARTCAICallKit 启动音视频通话
      result(true)
    case "callViodeAgent":
        AUIAICallManager.defaultManager.startCall(agentType: .VisionAgent)
      result(true)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
