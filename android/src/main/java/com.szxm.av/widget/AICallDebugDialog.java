package com.szxm.av.widget;

import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;

import com.aliyun.auikits.aiagent.ARTCAICallEngine;
import com.orhanobut.dialogplus.DialogPlus;
import com.orhanobut.dialogplus.ViewHolder;
import com.szxm.av.R;
import com.szxm.av.utils.DisplayUtil;

import org.json.JSONException;
import org.json.JSONObject;

public class AICallDebugDialog {
    public static void show(Context context, ARTCAICallEngine engine) {
        View view = LayoutInflater.from(context).inflate(R.layout.dialog_aicall_custom_debug_setting, null, false);
        ViewHolder viewHolder = new ViewHolder(view);

        EditText editTextAppServer = view.findViewById(R.id.et_debug_send_custom_message_to_server);
        EditText editTextllmPrompt = view.findViewById(R.id.et_debug_update_llm_prompt);
        EditText editTextCustomCapture = view.findViewById(R.id.et_debug_update_custom_capture);
        EditText editTextVcrConfig = view.findViewById(R.id.et_debug_vcr_update);
        EditText editTextBailianParams = view.findViewById(R.id.et_debug_bailian_params_update);

        DialogPlus dialog = DialogPlus.newDialog(context)
                .setContentHolder(viewHolder)
                .setGravity(Gravity.BOTTOM)
                .setExpanded(true, DisplayUtil.dip2px(650))
                .setOverlayBackgroundResource(android.R.color.transparent)
                .setContentBackgroundResource(R.color.layout_base_dialog_background)
                .setOnClickListener((dialog1, v) -> {
                    if(v.getId() == R.id.debug_send_custom_message_to_server) {
                        engine.sendCustomMessageToServer(editTextAppServer.getText().toString());
                    } else if(v.getId() == R.id.debug_update_llm_prompt) {
                        engine.updateLlmSystemPrompt(editTextllmPrompt.getText().toString());
                    } else if(v.getId() == R.id.debug_send_single_custom_capture) {
                        engine.startVisionCustomCapture(new ARTCAICallEngine.ARTCAICallVisionCustomCaptureRequest(editTextCustomCapture.getText().toString(), false, true, 5, 2, 2, ""));
                    } else if(v.getId() == R.id.debug_send_continus_custom_capture) {
                        engine.startVisionCustomCapture(new ARTCAICallEngine.ARTCAICallVisionCustomCaptureRequest(editTextCustomCapture.getText().toString(), false, false, 5, 2, 100, ""));
                    } else if(v.getId() == R.id.debug_stop_custom_capture) {
                        engine.stopVisionCustomCapture();
                    } else if(v.getId() == R.id.debug_send_continus_custom_capture_enable_asr) {
                        engine.startVisionCustomCapture(new ARTCAICallEngine.ARTCAICallVisionCustomCaptureRequest(editTextCustomCapture.getText().toString(), true, false, 5, 2, 100, ""));
                    } else if(v.getId() == R.id.debug_mute_agent_audio) {
                        engine.muteAgentAudioPlaying(true);
                    } else if(v.getId() == R.id.debug_unmute_agent_audio) {
                        engine.muteAgentAudioPlaying(false);
                    } else if(v.getId() == R.id.debug_send_text_to_agent) {
                        engine.sendTextToAgent(new ARTCAICallEngine.ARTCAICallSendTextToAgentRequest("今天天气怎么样"));
                    } else if(v.getId() == R.id.debug_update_vcr_config) {
                        String vcrConfigStr = editTextVcrConfig.getText().toString();
                        if(!TextUtils.isEmpty(vcrConfigStr)) {
                            try {
                                JSONObject jsonObject = new JSONObject(vcrConfigStr);

                                engine.updateVcrConfig(new ARTCAICallEngine.ARTCAICallAgentVcrConfig(jsonObject));
                            }catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                    } else if (v.getId() == R.id.debug_update_update_bailian_params) {
                        String bailianParams = editTextBailianParams.getText().toString();
                        if(!TextUtils.isEmpty(bailianParams)) {
                            engine.updateBailianAppParams(bailianParams);
                        }
                    }
                    dialog1.dismiss();
                })
                .create();
        dialog.show();

    }
}
