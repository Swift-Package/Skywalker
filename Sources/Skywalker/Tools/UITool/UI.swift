//
//  File.swift
//  
//
//  Created by 杨俊艺 on 2022/6/11.
//

import UIKit

@objcMembers
/// 用来判断设备及用户界面特征
public class UI: NSObject {
    
    public static let shared = UI.init()
    
    public var isPortrait: Bool {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .compactMap { $0 }
            .first!.interfaceOrientation.isPortrait
    }
    
    public var isiPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }
}

