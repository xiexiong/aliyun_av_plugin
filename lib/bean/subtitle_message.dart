class SubtitleMessage {
  final bool isAsrText; //isAsrText?麦克风听到的声音：机器人讲话
  final bool end; //检测是否讲完句子
  final String text; //句子文本
  final int asrSentenceId; //句子id

  SubtitleMessage({
    required this.isAsrText,
    required this.end,
    required this.text,
    required this.asrSentenceId,
  });

  factory SubtitleMessage.fromMap(Map<String, dynamic> map) {
    return SubtitleMessage(
      isAsrText: map['isAsrText'] as bool,
      end: map['end'] as bool,
      text: map['text'] as String,
      asrSentenceId: map['asrSentenceId'] as int,
    );
  }
}
