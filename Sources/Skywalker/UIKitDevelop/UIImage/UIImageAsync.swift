//
//  UIImageAsync.swift
//  
//
//  Created by 杨俊艺 on 2022/4/2.
//

import UIKit

public extension UIImage {
    
    @available(iOS 15.0, *)
    var thumbnail: UIImage? {
        get async {
            await self.byPreparingThumbnail(ofSize: .init(width: 40, height: 40))
        }
    }
    
}
