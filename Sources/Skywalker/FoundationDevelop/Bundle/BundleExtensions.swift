//
//  BundleExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/1/23.
//

import Foundation

@objc
public extension Bundle {
    var appName: String?        { object(forInfoDictionaryKey: "CFBundleName") as? String }
    
    var appVersion: String?     { object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String }
    
    var buildNumber: String?    { object(forInfoDictionaryKey: "CFBundleVersion") as? String }
    
}
