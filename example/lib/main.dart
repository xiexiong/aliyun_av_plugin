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
}

Future<void> _startCallVoice(bool aaa) async {
  // try {
  //   bool isSuccess = await AliyunAvPlugin.callAgentType(rtcConfig: _getRtcConfig(aaa));
  //   // ignore: avoid_print
  //   print('========Start call result: $isSuccess');
  // } catch (e) {
  //   // ignore: avoid_print
  //   print('========Start call error: $e');
  // }
}

// RtcConfig _getRtcConfig(bool isVoice) {
//   return RtcConfig(
//     agentType: isVoice ? 'VoiceAgent' : 'VisionAgent',
//     agentId: isVoice ? 'f05abdde9e5648efb966c3cb46361c5a' : '47b870aa48cc49d1b43485042c6ddcf5',
//     token: '',
//     userId: 'V123456',
//     loginAuthorization: 'Vabcdefg123456789',
//     sessionId: 'Xiex9919',
//     appId:
//         isVoice ? '28383372-04d8-4edd-b629-cf80c3bf2ec9' : 'd858f7bd-196d-45b8-88cd-3e8e9e72094f',
//     appKey: isVoice ? '7523e3057a76a46cf1325a54ac493fdb' : '19e1007f8a1c06ed234a0f374786c77f',
//     channelId: 'V1234567890abcdefg',
//   );
// }

class AvCallPage extends StatelessWidget {
  const AvCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 120.0),
          Center(
            child: GestureDetector(
              onTap: () {
                print('语音通话');
                _startCallVoice(true);
              },
              child: Container(width: 200.0, color: Colors.amber, child: Text('语音通话')),
            ),
          ),
          SizedBox(height: 80.0),
          Center(
            child: GestureDetector(
              onTap: () {
                print('视频通话');
                _startCallVoice(false);
              },
              child: Container(width: 200.0, color: Colors.amber, child: Text('视频通话')),
            ),
          ),
        ],
      ),
    );
  }
}
