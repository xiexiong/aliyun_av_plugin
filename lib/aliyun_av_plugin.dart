import 'package:aliyun_av_plugin/bean/rtc_config.dart';
import 'package:aliyun_av_plugin/bean/subtitle_message.dart';
import 'package:flutter/services.dart';

class AliyunAvPlugin {
  static const MethodChannel _channel = MethodChannel('aliyun_av_plugin');

  /// 启动音视频通话
  static Future<bool> callAgentType({required RtcConfig rtcConfig}) async {
    try {
      // 建议将 rtcConfig 转为 Map 传递，确保平台端能正确解析
      final result = await _channel.invokeMethod<bool>('callAgentType', {
        'rtcConfigBean': rtcConfig.toMap(),
      });
      return result ?? false;
    } on PlatformException catch (e) {
      // 可根据实际需求打印日志或上报错误
      print('callAgentType error: ${e.message}');
      return false;
    }
  }

  static void setSubtitleUpdateHandler(void Function(SubtitleMessage) handler) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onSubtitleUpdate') {
        try {
          final args = call.arguments;
          if (args is Map) {
            final msg = SubtitleMessage.fromMap(Map<String, dynamic>.from(args));
            handler(msg);
          } else {
            // ignore: avoid_print
            print('onSubtitleUpdate: arguments is not a Map');
          }
        } catch (e) {
          // ignore: avoid_print
          print('onSubtitleUpdate: error parsing arguments: $e');
        }
      }
    });
  }
}
