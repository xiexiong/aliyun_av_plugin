//
//  AUIAICallBottomView.swift
//  AUIAICall
//
//  Created by Bingo on 2024/7/8.
//

import UIKit
import AUIFoundation
import ARTCAICallKit

@objcMembers open class AUIAICallBottomView: UIView {

    public init(agentType: ARTCAICallAgentType) {
        self.agentType = agentType
        super.init(frame: CGRect.zero)
        
        self.addSubview(self.tipsLabel)
        self.addSubview(self.handupBtn)
        self.addSubview(self.muteAudioBtn)
        self.addSubview(self.switchSpeakerBtn)
        self.addSubview(self.statementLabel)
        
        if self.enableCamera {
            self.addSubview(self.muteCameraBtn)
            self.addSubview(self.switchCameraBtn)
        }
        
        self.addSubview(self.pushToTalkBtn)
        
        self.addSubview(self.timeLabel)
        
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public let agentType: ARTCAICallAgentType
    
    public var enablePushToTalk: Bool = false {
        didSet {
            self.muteAudioBtn.isHidden = self.enablePushToTalk
            self.pushToTalkBtn.isHidden = !self.enablePushToTalk
            
            self.setNeedsLayout()
        }
    }
    
    private var enableCamera: Bool {
        return self.agentType == .VisionAgent || self.agentType == .VideoAgent
    }
    
    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view == self {
            return nil
        }
        return view
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        let bot = self.av_height - UIView.av_safeBottom - 30
        self.gradientlayer.frame = self.bounds
        self.statementLabel.frame = CGRect(x: 0, y:self.av_height - UIView.av_safeBottom - 18, width: self.av_width, height:18)
        self.tipsLabel.frame = CGRect(x: 0, y:self.av_height - UIView.av_safeBottom - (46+311)/2, width: self.av_width, height:23)
        
        
        self.handupBtn.iconMargin = 5
        self.handupBtn.av_size = CGSize(width: 70, height: 70)
        self.handupBtn.av_centerY = bot - self.handupBtn.av_height / 2.0
        
        // 静音
        self.muteAudioBtn.av_size = CGSize(width: 70, height: 70)
        self.muteAudioBtn.av_centerY = bot - self.handupBtn.av_height / 2.0
        
        // 通话时间
        self.timeLabel.frame = CGRect(x: 0, y: self.handupBtn.av_top - 22 - 24, width: self.av_width, height: 22)
        // 视觉通话
        if self.enableCamera {
            self.handupBtn.av_centerX = self.av_width / 2.0
            self.muteAudioBtn.av_centerX = 50 + self.muteAudioBtn.av_width / 2.0
            // 扬声器
            self.switchSpeakerBtn.isHidden = false;
            self.switchSpeakerBtn.iconMargin = 14
            self.switchSpeakerBtn.av_size = CGSize(width: 70, height: 70)
            self.switchSpeakerBtn.av_centerX = self.av_width - 50 - self.switchSpeakerBtn.av_width / 2.0
            self.switchSpeakerBtn.av_centerY = bot - self.switchSpeakerBtn.av_height / 2.0
        } else {
            self.handupBtn.av_left = 60
            self.muteAudioBtn.av_left = self.av_width - 60 - self.muteAudioBtn.av_width
            self.switchSpeakerBtn.isHidden = true;
        }
    }
    
    open lazy var gradientlayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.colors = [UIColor.black.withAlphaComponent(0.0).cgColor, UIColor.black.withAlphaComponent(1).cgColor]
        return layer
    }()
    
    open lazy var tipsLabel: UILabel = {
        let label = UILabel()
        label.textColor =  UIColor(red: 81/255, green: 86/255, blue: 95/255, alpha: 1)
        label.textAlignment = .center
        label.font = AVTheme.regularFont(15)
        label.text = ""
        return label
    }()
    
    open lazy var statementLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = AVTheme.regularFont(13)
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
        label.text = "内容由AI生成"
        return label
    }()
    
    open lazy var handupBtn: AUIAICallButton = {
        let btn = AUIAICallButton.create(title: AUIAICallBundle.getString("Hang Up"), iconBgColor: AUIAICallBundle.danger_strong, normalIcon: AUIAICallBundle.getCommonImage("cs_handup"))
        return btn
    }()
    
    open lazy var muteAudioBtn: AUIAICallButton = {
        let btn = AUIAICallButton.create(title: AUIAICallBundle.getString("Mute"), iconBgColor: AVTheme.tsp_fill_ultraweak, normalIcon: AUIAICallBundle.getCommonImage("cs_mic_1"), selectedTitle:AUIAICallBundle.getString("Unmute"), selectedIcon:AUIAICallBundle.getCommonImage("cs_mic_0"))
        return btn
    }()
    
    open lazy var muteCameraBtn: AUIAICallButton = {
        let btn = AUIAICallButton.create(title: AUIAICallBundle.getString("Turn Off Camera"), iconBgColor: AVTheme.tsp_fill_ultraweak, normalIcon: AUIAICallBundle.getCommonImage("ic_mute_camera"), selectedTitle:AUIAICallBundle.getString("Turn On Camera"), selectedIcon:AUIAICallBundle.getCommonImage("ic_mute_camera_selected"))
        return btn
    }()
    
    open lazy var switchSpeakerBtn: AUIAICallButton = {
        let btn = AUIAICallButton.create(title: AUIAICallBundle.getString("Turn Off Speaker"), iconBgColor: AVTheme.tsp_fill_ultraweak, normalIcon: AUIAICallBundle.getCommonImage("cs_video_0"), selectedTitle:AUIAICallBundle.getString("Turn On Speaker"), selectedIcon:AUIAICallBundle.getCommonImage("cs_video_1"))
        return btn
    }()
    
    lazy var switchCameraBtn: AVBlockButton = {
        let btn = AVBlockButton()
        btn.setImage(AUIAICallBundle.getCommonImage("ic_switch_camera"), for: .normal)
        return btn
    }()
    
    open lazy var pushToTalkBtn: AUIAICallButton = {
        let btn = AUIAICallButton.create(title: AUIAICallBundle.getString("Push to Talk"),
                                         iconBgColor: AVTheme.fill_infrared,
                                         normalIcon: AUIAICallBundle.getCommonImage("ic_ptt_press"),
                                         selectedBgColor: AVTheme.colourful_fill_strong,
                                         selectedTitle:AUIAICallBundle.getString("Release to Send"),
                                         selectedIcon:AUIAICallBundle.getCommonImage("ic_ptt_release"))
        btn.isHidden = true
        return btn
    }()
    
    open lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 81/255, green: 86/255, blue: 95/255, alpha: 1)
        label.textAlignment = .center
        label.font = AVTheme.regularFont(15)
        label.text = ""
        return label
    }()
}
