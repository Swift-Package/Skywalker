//
//  ImagePublisherProtocol.swift
//  
//
//  Created by 杨俊艺 on 2023/2/13.
//

import UIKit
import Combine

public protocol ImagePublisher {
    func imagePublisher() -> AnyPublisher<UIImage?, Never>
}
