//
//  TimerExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/4/19.
//

import UIKit
import Combine

public extension Timer {
    
    static func loop(every interval: TimeInterval, over total: Int) -> AnyPublisher<Int, Never> {
        if total < 1 { return Empty.init().eraseToAnyPublisher() }
        return self.publish(every: interval, on: .main, in: .common).autoconnect()
            .scan(0) { accumulator, date in
                (accumulator + 1) % total
            }
            .prepend(0)
            .eraseToAnyPublisher()
    }
}

let array: [ImagePublisher] = ["some", UIColor.white]

// Timer.loop(every: 4, over: array.count)
//    .flatMap { array[$0].imagePublisher() }
//    .assign(to: \.image, on: UIImageView.init())
//    .store(in: &cancellables)
