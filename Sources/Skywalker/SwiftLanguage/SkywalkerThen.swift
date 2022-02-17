//
//  SkywalkerThen.swift
//  
//
//  Created by 杨俊艺 on 2022/2/17.
//

import Foundation

#if !os(Linux)
    import CoreGraphics
#endif

#if os(iOS) || os(tvOS)
    import UIKit.UIGeometry
#endif

public protocol Then {}

extension Then where Self: AnyObject {
    @inlinable
    public func then(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}

extension Then where Self: Any {
  /// Makes it available to set properties with closures just after initializing and copying the value types
    @inlinable
    public func with(_ block: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try block(&copy)
        return copy
    }

    @inlinable
    public func `do`(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}

extension NSObject: Then {}
extension Array: Then {}
extension Dictionary: Then {}
extension Set: Then {}

#if !os(Linux)
    extension CGPoint: Then {}
    extension CGRect: Then {}
    extension CGSize: Then {}
    extension CGVector: Then {}
#endif

#if os(iOS) || os(tvOS)
    extension UIEdgeInsets: Then {}
    extension UIOffset: Then {}
    extension UIRectEdge: Then {}
#endif


//    let label = UILabel().then {
//        $0.textAlignment = .center
//        $0.textColor = UIColor.black
//        $0.text = "Hello, World!"
//    }

//    UserDefaults.standard.do {
//        $0.set("devxoul", forKey: "username")
//        $0.set("devxoul@gmail.com", forKey: "email")
//        $0.synchronize()
//    }

//    let frame = CGRect().with {
//        $0.origin.x = 10
//        $0.size.width = 100
//    }
