//
//  DateFormat.swift
//
//
//  Created by 杨俊艺 on 2022/2/23.
//

import Foundation

public extension Date {
    @available(iOS 15.0, *)
    var displayFormat: String {
        formatted(.dateTime
            .year(.defaultDigits)
            .month(.wide)
            .day(.twoDigits)
            .hour(.conversationalDefaultDigits(amPM: .wide))
            .minute()
        )
    }

    /// 一般情况下服务器接受的JSON形式
    @available(iOS 15.0, *)
    var json: String {
        formatted(.iso8601)
    }
}
