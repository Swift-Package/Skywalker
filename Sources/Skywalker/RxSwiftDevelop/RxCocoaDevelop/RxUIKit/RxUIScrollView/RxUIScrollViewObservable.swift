//
//  RxUIScrollViewObservable.swift
//  
//
//  Created by 杨俊艺 on 2023/11/29.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIScrollView {
    var xOffset: Observable<CGFloat> {
        return contentOffset.map { $0.x }
    }
}
