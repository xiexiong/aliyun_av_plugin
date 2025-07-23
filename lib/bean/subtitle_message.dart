class SubtitleMessage {
  final bool resetSubtitle;
  final bool isAsrText; //isAsrText?麦克风听到的声音：机器人讲话
  final bool end; //检测是否讲完句子
  String? text; //句子文本
  final int asrSentenceId; //句子id
  final bool isCallEnd;

  SubtitleMessage({
    required this.resetSubtitle,
    required this.isAsrText,
    required this.end,
    required this.text,
    required this.asrSentenceId,
    required this.isCallEnd,
  });

  factory SubtitleMessage.fromMap(Map<String, dynamic> map) {
    return SubtitleMessage(
      resetSubtitle: map['resetSubtitle'] as bool,
      isAsrText: map['isAsrText'] as bool,
      end: map['end'] as bool,
      text: map['text'] as String,
      asrSentenceId: map['asrSentenceId'] as int,
      isCallEnd: map['isCallEnd'] as bool,
    );
  }
}
