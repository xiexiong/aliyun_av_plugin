package com.szxm.av;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;

import com.aliyun.auikits.aiagent.ARTCAICallEngine;
import com.aliyun.auikits.aiagent.ARTCAICallEngineImpl;
import com.szxm.av.utils.AUIAIConstStrKey;

public class AUIAICallInCallController {
    private static AUIAICallInCallController instance;
    private Context appContext;
    private ARTCAICallEngineImpl engine = null;

    
    private AUIAICallInCallController(Context context) {
        this.appContext = context.getApplicationContext();
    }

    public static synchronized void initialize(Context context) {
        if (instance == null) {
            instance = new AUIAICallInCallController(context);
        }
    }
    public static AUIAICallInCallController getInstance() {
        if (instance == null) {
            throw new IllegalStateException("Must call initialize() first");
        }
        return instance;
    }

    public void callAgentType(String appid,String appkey,String channelId,String agentType,String agentId,String rtcToken,String UserId,
                                String loginAuthorization,String chatBotAgentId ,String sessionId  ,String receiverId ) {
        ARTCAICallEngine.ARTCAICallAgentType agentEnumType = null;
        if (agentType.equals("VisionAgent")){
            agentEnumType = ARTCAICallEngine.ARTCAICallAgentType.VisionAgent;
        }else{
            agentEnumType = ARTCAICallEngine.ARTCAICallAgentType.VoiceAgent;
        }
        rtcToken = TextUtils.isEmpty(rtcToken)?ArtcTokenUtils.createBase64Token(appid,appkey,channelId,UserId):rtcToken;
        
        Intent intent = new Intent(this.appContext, AUIAICallInCallActivity.class);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_LOGIN_USER_ID, UserId);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_LOGIN_AUTHORIZATION, loginAuthorization);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_AI_AGENT_TYPE, agentEnumType);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_RTC_AUTH_TOKEN, rtcToken);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_AI_AGENT_ID, agentId);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_IS_SHARED_AGENT, false);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_CHAT_BOT_AGENT_ID, chatBotAgentId);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_SESSION_ID, sessionId);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_RECEIVER_ID, receiverId);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        appContext.startActivity(intent);
    }

    public void callAgentType(String agentType,String agentId,String rtcToken,String UserId,String loginAuthorization,String sessionId) {
        ARTCAICallEngine.ARTCAICallAgentType agentEnumType = null;
        if (agentType.equals("VisionAgent")){
            agentEnumType = ARTCAICallEngine.ARTCAICallAgentType.VisionAgent;
        }else{
            agentEnumType = ARTCAICallEngine.ARTCAICallAgentType.VoiceAgent;
        }
        // rtcToken = TextUtils.isEmpty(rtcToken)?ArtcTokenUtils.createBase64Token(appid,appkey,channelId,UserId):rtcToken;
        
        Intent intent = new Intent(this.appContext, AUIAICallInCallActivity.class);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_LOGIN_USER_ID, UserId);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_LOGIN_AUTHORIZATION, loginAuthorization);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_AI_AGENT_TYPE, agentEnumType);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_RTC_AUTH_TOKEN, rtcToken);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_AI_AGENT_ID, agentId);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_KEY_IS_SHARED_AGENT, false);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_CHAT_BOT_AGENT_ID, agentId);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_SESSION_ID, sessionId);
        intent.putExtra(AUIAIConstStrKey.BUNDLE_RECEIVER_ID, UserId);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        appContext.startActivity(intent);
    }




}
