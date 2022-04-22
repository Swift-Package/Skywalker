//
//  ImagePublisher.swift
//  
//
//  Created by 杨俊艺 on 2022/4/19.
//

import Foundation

public protocol ImagePublisher {
    func imagePublisher() -> AnyPublisher<UIImage?, Never>
}

extension URL: ImagePublisher {
    /// 通过URL生成图片发布者
    /// - Returns: 图片发布者
    public func imagePublisher() -> AnyPublisher<UIImage?, Never> {
        URLSession.shared.dataTaskPublisher(for: self)
            .map { UIImage.init(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}


extension String: ImagePublisher {
    /// 通过字符串生成图片发布者
    /// - Returns: 图片发布者 "name".imagePublisher().assign(to: \.image, on: UIImageView.init()).store(in: &cancellables)
    public func imagePublisher() -> AnyPublisher<UIImage?, Never> {
        if let url = URL.init(string: self), url.scheme == "https" {
            return url.imagePublisher()
        } else {
            return Just(UIImage.init(named: self)).eraseToAnyPublisher()
        }
    }
}

extension UIColor: ImagePublisher {
    public func imagePublisher() -> AnyPublisher<UIImage?, Never> {
        return Deferred<AnyPublisher<UIImage?, Never>> {
            let rect = CGRect.init(x: 0, y: 0, width: 300, height: 300)
            UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
            self.setFill()
            UIBezierPath.init(ovalIn: rect).fill()
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return Just(image).eraseToAnyPublisher()
        }
        .subscribe(on: DispatchQueue.global(qos: .utility))
        .receive(on: RunLoop.main).eraseToAnyPublisher()
    }
}

