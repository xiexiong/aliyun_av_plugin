/// ARTc实体对象类
class RtcConfig {
  final String? appId;
  final String? appKey;
  String? channelId;
  final String userId;
  final String token;
  final String? sessionId;
  final String agentType;
  final String loginAuthorization;
  final String agentId;
  final String? voiceInstanceId;
  final String? videoInstanceId;
  final String? voiceToken;
  final String? videoToken;
  String? roomId;
  final String? app_param;
  final String? prologue;

  RtcConfig({
    this.appId,
    this.appKey,
    this.channelId,
    required this.userId,
    required this.token,
    this.sessionId,
    required this.agentType,
    required this.loginAuthorization,
    required this.agentId,
    this.voiceInstanceId,
    this.videoInstanceId,
    this.voiceToken,
    this.videoToken,
    required this.roomId,
    required this.app_param,
    required this.prologue,
  });

  // 可选：从Map创建对象
  factory RtcConfig.fromMap(Map<String, dynamic> map) {
    return RtcConfig(
      appId: map['appId'] ?? '',
      appKey: map['appKey'] ?? '',
      channelId: map['channelId'] ?? '',
      userId: map['userId'] ?? '',
      token: map['token'] ?? '',
      sessionId: map['sessionId'] ?? '',
      agentType: map['agentType'] ?? '',
      loginAuthorization: map['loginAuthorization'] ?? '',
      agentId: map['agentId'] ?? '',
      voiceInstanceId: map['voiceInstanceId'] ?? '',
      videoInstanceId: map['videoInstanceId'] ?? '',
      voiceToken: map['voiceToken'] ?? '',
      videoToken: map['videoToken'] ?? '',
      roomId: map['roomId'] ?? '',
      app_param: map['app_param'] ?? '',
      prologue: map['prologue'] ?? '',
    );
  }

  // 可选：转为Map
  Map<String, dynamic> toMap() {
    return {
      'appId': appId,
      'appKey': appKey,
      'channelId': channelId,
      'userId': userId,
      'token': token,
      'sessionId': sessionId,
      'agentType': agentType,
      'loginAuthorization': loginAuthorization,
      'agentId': agentId,
      'voiceInstanceId': voiceInstanceId,
      'videoInstanceId': videoInstanceId,
      'voiceToken': voiceToken,
      'videoToken': videoToken,
      'roomId': roomId,
      'app_param': app_param,
      'prologue': prologue,
    };
  }
}
