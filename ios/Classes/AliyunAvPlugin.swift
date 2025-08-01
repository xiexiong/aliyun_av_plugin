public class AliyunAvPlugin: NSObject, FlutterPlugin {
  private static var channel: FlutterMethodChannel?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "aliyun_av_plugin", binaryMessenger: registrar.messenger())
    AliyunAvPlugin.channel = channel
    let instance = AliyunAvPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      guard let args = call.arguments as? [String: Any],
            let type = args["agentType"] as? String else {
          result(false)
          return
      }

      switch type {
      case "VoiceAgent":
          AUIAICallManager.defaultManager.startCall(agentType: .VoiceAgent) {
              AliyunAvPlugin.channel?.invokeMethod("onSubtitleUpdate", arguments: null)
          }
          result(true)
      case "VisionAgent":
          AUIAICallManager.defaultManager.startCall(agentType: .VisionAgent) {
              AliyunAvPlugin.channel?.invokeMethod("onSubtitleUpdate", arguments: null)
          }
          result(true)
      default:
          result(FlutterMethodNotImplemented)
      }
  }
}