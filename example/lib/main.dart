import 'package:aliyun_av_plugin/bean/subtitle_message.dart';
import 'package:flutter/material.dart';
import 'package:aliyun_av_plugin/aliyun_av_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SubtitleMessage? _subtitle;

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Aliyun AV Demo',
  //     debugShowCheckedModeBanner: false,
  //     home: const AvCallPage(),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    AliyunAvPlugin.setSubtitleUpdateHandler((SubtitleMessage msg) {
      setState(() {
        _subtitle = msg;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _subtitle == null
        ? const SizedBox.shrink()
        : Container(
          padding: const EdgeInsets.all(12),
          color: Colors.black54,
          child: Text(
            _subtitle!.text ?? '',
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        );
  }
}

// Future<void> _startCallVoice() async {
//   try {
//     bool isSuccess = await AliyunAvPlugin.callAgentType(userId: "user1", loginAuthor: "channelA");
//     // ignore: avoid_print
//     print('========Start call result: $isSuccess');
//   } catch (e) {
//     // ignore: avoid_print
//     print('========Start call error: $e');
//   }
// }

// class AvCallPage extends StatelessWidget {
//   const AvCallPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 120.0),
//           Center(
//             child: GestureDetector(
//               onTap: () {
//                 print('语音通话');
//                 // _startCallVoice();
//               },
//               child: Container(width: 200.0, color: Colors.amber, child: Text('语音通话')),
//             ),
//           ),
//           SizedBox(height: 80.0),
//           Center(
//             child: GestureDetector(
//               onTap: () {
//                 print('视频通话');
//                 // _startCallVideo();
//               },
//               child: Container(width: 200.0, color: Colors.amber, child: Text('视频通话')),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
