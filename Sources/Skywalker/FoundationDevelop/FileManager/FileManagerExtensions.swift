//
//  FileManagerExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/3/31.
//

import Foundation

@objc
public extension FileManager {
    
    static var documentsDirectoryURL: URL {
        `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
