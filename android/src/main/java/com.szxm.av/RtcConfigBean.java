package com.szxm.av;

import java.io.Serializable;
import java.util.Map;

public class RtcConfigBean implements Serializable {
    private String appId;
    private String appKey;
    private String channelId;
    private String userId;
    private String token;
    private String agentId;
    private String sessionId;
    private String receiverId;
    private String agentType;
    private String chatBotAgentId;
    private String loginAuthorization;

    public RtcConfigBean() {}

    public RtcConfigBean(String appId, String appKey, String channelId, String userId, String token,
                         String agentId, String sessionId, String receiverId, String agentType,
                         String chatBotAgentId, String loginAuthorization) {
        this.appId = appId;
        this.appKey = appKey;
        this.channelId = channelId;
        this.userId = userId;
        this.token = token;
        this.agentId = agentId;
        this.sessionId = sessionId;
        this.receiverId = receiverId;
        this.agentType = agentType;
        this.chatBotAgentId = chatBotAgentId;
        this.loginAuthorization = loginAuthorization;
    }

    // 支持从 Map 构造，方便 Flutter 端参数转换
    public static RtcConfigBean fromMap(Map<String, Object> map) {
        RtcConfigBean bean = new RtcConfigBean();
        bean.setAppId((String) map.getOrDefault("appId", ""));
        bean.setAppKey((String) map.getOrDefault("appKey", ""));
        bean.setChannelId((String) map.getOrDefault("channelId", ""));
        bean.setUserId((String) map.getOrDefault("userId", ""));
        bean.setToken((String) map.getOrDefault("token", ""));
        bean.setAgentId((String) map.getOrDefault("agentId", ""));
        bean.setSessionId((String) map.getOrDefault("sessionId", ""));
        bean.setReceiverId((String) map.getOrDefault("receiverId", ""));
        bean.setAgentType((String) map.getOrDefault("agentType", ""));
        bean.setChatBotAgentId((String) map.getOrDefault("chatBotAgentId", ""));
        bean.setLoginAuthorization((String) map.getOrDefault("loginAuthorization", ""));
        return bean;
    }

    // Getter & Setter 略（可用 IDE 自动生成）

    public String getAppId() { return appId; }
    public void setAppId(String appId) { this.appId = appId; }
    public String getAppKey() { return appKey; }
    public void setAppKey(String appKey) { this.appKey = appKey; }
    public String getChannelId() { return channelId; }
    public void setChannelId(String channelId) { this.channelId = channelId; }
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public String getToken() { return token; }
    public void setToken(String token) { this.token = token; }
    public String getAgentId() { return agentId; }
    public void setAgentId(String agentId) { this.agentId = agentId; }
    public String getSessionId() { return sessionId; }
    public void setSessionId(String sessionId) { this.sessionId = sessionId; }
    public String getReceiverId() { return receiverId; }
    public void setReceiverId(String receiverId) { this.receiverId = receiverId; }
    public String getAgentType() { return agentType; }
    public void setAgentType(String agentType) { this.agentType = agentType; }
    public String getChatBotAgentId() { return chatBotAgentId; }
    public void setChatBotAgentId(String chatBotAgentId) { this.chatBotAgentId = chatBotAgentId; }
    public String getLoginAuthorization() { return loginAuthorization; }
    public void setLoginAuthorization(String loginAuthorization) { this.loginAuthorization = loginAuthorization; }

    @Override
    public String toString() {
        return "RtcConfigBean{" +
                "appId='" + appId + '\'' +
                ", appKey='" + appKey + '\'' +
                ", channelId='" + channelId + '\'' +
                ", userId='" + userId + '\'' +
                ", token='" + token + '\'' +
                ", agentId='" + agentId + '\'' +
                ", sessionId='" + sessionId + '\'' +
                ", receiverId='" + receiverId + '\'' +
                ", agentType='" + agentType + '\'' +
                ", chatBotAgentId='" + chatBotAgentId + '\'' +
                ", loginAuthorization='" + loginAuthorization + '\'' +
                '}';
    }
}