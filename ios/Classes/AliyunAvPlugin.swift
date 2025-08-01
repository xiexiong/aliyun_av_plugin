
import Flutter
import AUIAICall
import UIKit

public class AliyunAvPlugin: NSObject, FlutterPlugin {
    private static var channel: FlutterMethodChannel?
    private var callManager = AUIAICallManager.defaultManager
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "aliyun_av_plugin",
            binaryMessenger: registrar.messenger()
        )
        let instance = AliyunAvPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        self.channel = channel
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any] else {
            result(FlutterError(
                code: "INVALID_ARGUMENTS",
                message: "Arguments must be a dictionary",
                details: nil
            ))
            return
        }
        
        callManager.startCall(callArgs: args) { [weak self] in
            self?.invokeSubtitleUpdate()
        }
        result(true)
    }
    
    private func invokeSubtitleUpdate() {
        AliyunAvPlugin.channel?.invokeMethod("onSubtitleUpdate", arguments: nil)
    }
}
