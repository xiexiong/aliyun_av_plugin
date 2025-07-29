import 'dart:convert';

import 'package:aliyun_av_plugin/bean/rtc_config.dart';
import 'package:aliyun_av_plugin/bean/sub_message_item.dart';
import 'package:flutter/services.dart';

class AliyunAvPlugin {
  static const MethodChannel _channel = MethodChannel('aliyun_av_plugin');

  /// 启动音视频通话
  static Future<bool> callAgentType({required RtcConfig rtcConfig}) async {
    try {
      // 建议将 rtcConfig 转为 Map 传递，确保平台端能正确解析
      final result = await _channel.invokeMethod<bool>('callAgentType', rtcConfig.toMap());
      return result ?? false;
    } on PlatformException catch (e) {
      // 可根据实际需求打印日志或上报错误
      // ignore: avoid_print
      print('callAgentType error: ${e.message}');
      return false;
    }
  }

  static void setSubtitleUpdateHandler(void Function(List<SubMessageItem>) handler) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onSubtitleUpdate') {
        try {
          final args = call.arguments;
          if (args is String) {
            // args 是 json array 字符串
            final List<dynamic> jsonList = json.decode(args);
            final List<SubMessageItem> items =
                jsonList
                    .map(
                      (e) => SubMessageItem(
                        isAsrText: e['isAsrText'] as bool,
                        asrSentenceId: e['asrSentenceId'] as int,
                        receiveTime: e['receiveTime'] as int,
                        text: e['text'] as String,
                        displayEndTime: e['displayEndTime'] as int,
                      ),
                    )
                    .toList();
            handler(items);
          } else {
            // ignore: avoid_print
            print('onSubtitleUpdate: arguments is not a JSON array string');
          }
        } catch (e, stack) {
          // ignore: avoid_print
          print('onSubtitleUpdate: error parsing arguments: $e\n$stack');
        }
      }
    });
  }
}
