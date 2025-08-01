import 'package:aliyun_av_plugin/aliyun_av_plugin.dart';
import 'package:aliyun_av_plugin/bean/rtc_config.dart';
import 'package:aliyun_av_plugin/bean/subtitle_message.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: unused_field
  SubtitleMessage? _subtitle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aliyun AV Demo',
      debugShowCheckedModeBanner: false,
      home: const AvCallPage(),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   AliyunAvPlugin.setSubtitleUpdateHandler((SubtitleMessage msg) {
  //     setState(() {
  //       _subtitle = msg;
  //     });
  //   });
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return _subtitle == null
  //       ? const SizedBox.shrink()
  //       : Container(
  //         padding: const EdgeInsets.all(12),
  //         color: Colors.black54,
  //         child: Text(
  //           _subtitle!.text ?? '',
  //           style: const TextStyle(color: Colors.white, fontSize: 18),
  //         ),
  //       );
  // }
}

RtcConfig _getRtcConfig(bool isVoice) {
  // return RtcConfig(
  //   appId:
  //       isVoice ? '28383372-04d8-4edd-b629-cf80c3bf2ec9' : 'd858f7bd-196d-45b8-88cd-3e8e9e72094f',
  //   appKey: isVoice ? '7523e3057a76a46cf1325a54ac493fdb' : '19e1007f8a1c06ed234a0f374786c77f',
  //   channelId: 'V${DateTime.now().millisecondsSinceEpoch}',
  //   userId: 'V123456',
  //   token: '',
  //   sessionId: '',
  //   agentType: isVoice ? 'VoiceAgent' : 'VisionAgent',
  //   loginAuthorization: 'Vabcdefg123456789',
  //   agentId: isVoice ? 'f05abdde9e5648efb966c3cb46361c5a' : '47b870aa48cc49d1b43485042c6ddcf5',
  // );

  final userId = 'V123456';
  final sessionIdStr = 'xxx';
  final callType = isVoice ? 'VoiceAgent' : 'VisionAgent';

  // 构建 userData 字段
  final userData = {
    'userId': userId,
    'roomId': "7",
    'sessionId': sessionIdStr,
    'appParam': {
      "openToken": "11212sds",
      "appKey": "GAB3gEpJZNJB6__-mnMtUt==",
      "serviceId": "sasad2q323wsddsdsdsddssdsddsds",
    },
    'callType': callType,
  };

  return RtcConfig(
    agentType: callType,
    agentId: '',
    token: '',
    userId: userId,
    loginAuthorization: '',
    sessionId: sessionIdStr,
    prologue: '',
    userData: userData.toString(),
  );
}

class AvCallPage extends StatelessWidget {
  const AvCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 320.0, width: double.infinity),
          GestureDetector(
            onTap: () async {
              print('语音通话');
              bool isSuccess = await AliyunAvPlugin.callAgentType(rtcConfig: _getRtcConfig(true));
            },
            child: Container(
              alignment: Alignment.center,
              width: 200.0,
              height: 50,
              color: Colors.amber,
              child: Text('语音通话'),
            ),
          ),

          SizedBox(height: 80.0),
          GestureDetector(
            onTap: () async {
              print('视频通话');
              bool isSuccess = await AliyunAvPlugin.callAgentType(rtcConfig: _getRtcConfig(false));
            },
            child: Container(
              alignment: Alignment.center,
              width: 200.0,
              height: 50,
              color: Colors.amber,
              child: Text('视频通话'),
            ),
          ),
        ],
      ),
    );
  }
}
