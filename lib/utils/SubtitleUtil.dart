import 'package:aliyun_av_plugin/bean/subtitle_message.dart';

class SubtitleUtil {
  final List<SubtitleMessage> subtitleMessageList = [];

  void cleanSubtitleList() {
    subtitleMessageList.clear();
  }

  /// 添加一条字幕记录
  void addSubtitleItem(SubtitleMessage subtitleMessage) {
    subtitleMessageList.add(subtitleMessage);
    // 可根据需要添加通知刷新UI的逻辑
  }

  /// 追加更新一条字幕记录
  void appendToLastSubtitle(SubtitleMessage subtitleMessage) {
    if (subtitleMessageList.isNotEmpty) {
      final last = subtitleMessageList.last;
      last.text = (last.text ?? '') + (subtitleMessage.text ?? '');
      // 可根据需要添加通知刷新UI的逻辑
    } else {
      addSubtitleItem(subtitleMessage);
    }
  }

  /// 替换更新一条字幕记录
  void replaceLastSubtitle(SubtitleMessage subtitleMessage) {
    if (subtitleMessageList.isNotEmpty) {
      final last = subtitleMessageList.last;
      if (subtitleMessage.isAsrText == last.isAsrText &&
          subtitleMessage.asrSentenceId == last.asrSentenceId) {
        last.text = subtitleMessage.text;
        // 可根据需要添加通知刷新UI的逻辑
      } else {
        addSubtitleItem(subtitleMessage);
      }
    } else {
      addSubtitleItem(subtitleMessage);
    }
  }

  /// 获取完整的字幕文本
  String getFullSubtitleText() {
    return subtitleMessageList.map((e) => e.text ?? '').join();
  }

  /// 获取当前最后一条字幕对象（如果没有则返回null）
  SubtitleMessage? getCurrentSubtitle() {
    if (subtitleMessageList.isNotEmpty) {
      return subtitleMessageList.last;
    }
    return null;
  }

  /// 获取所有字幕对象
  List<SubtitleMessage> getAllSubtitles() {
    return List.unmodifiable(subtitleMessageList);
  }
}
