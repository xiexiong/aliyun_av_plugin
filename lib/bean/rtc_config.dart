/// ARTc实体对象类
class RtcConfig {
  final String appId;
  final String appKey;
  final String channelId;
  final String userId;
  final String token;
  final String chatBotAgentId;
  final String sessionId;
  final String receiverId;
  final String agentType;
  final String loginAuthorization;
  final String agentId;

  RtcConfig({
    required this.appId,
    required this.appKey,
    required this.channelId,
    required this.userId,
    required this.token,
    required this.chatBotAgentId,
    required this.sessionId,
    required this.receiverId,
    required this.agentType,
    required this.loginAuthorization,
    required this.agentId,
  });

  // 可选：从Map创建对象
  factory RtcConfig.fromMap(Map<String, dynamic> map) {
    return RtcConfig(
      appId: map['appId'] ?? '',
      appKey: map['appKey'] ?? '',
      channelId: map['channelId'] ?? '',
      userId: map['userId'] ?? '',
      token: map['token'] ?? '',
      chatBotAgentId: map['chatBotAgentId'] ?? '',
      sessionId: map['sessionId'] ?? '',
      receiverId: map['receiverId'] ?? '',
      agentType: map['agentType'] ?? '',
      loginAuthorization: map['loginAuthorization'] ?? '',
      agentId: map['agentId'] ?? '',
    );
  }

  // 可选：转为Map
  Map<String, String> toMap() {
    return {
      'appId': appId,
      'appKey': appKey,
      'channelId': channelId,
      'userId': userId,
      'token': token,
      'chatBotAgentId': chatBotAgentId,
      'sessionId': sessionId,
      'receiverId': receiverId,
      'agentType': agentType,
      'loginAuthorization': loginAuthorization,
      'agentId': agentId,
    };
  }
}
