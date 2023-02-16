//
//  UIColorImagePublisher.swift
//
//
//  Created by 杨俊艺 on 2023/2/13.
//

import Combine
import UIKit

extension UIColor: ImagePublisher {
    public func imagePublisher() -> AnyPublisher<UIImage?, Never> {
        return Deferred<AnyPublisher<UIImage?, Never>> {
            let rect = CGRect(x: 0, y: 0, width: 300, height: 300)
            UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
            self.setFill()
            UIBezierPath(ovalIn: rect).fill()
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return Just(image).eraseToAnyPublisher()
        }
        .subscribe(on: DispatchQueue.global(qos: .utility))
        .receive(on: RunLoop.main).eraseToAnyPublisher()
    }
}
