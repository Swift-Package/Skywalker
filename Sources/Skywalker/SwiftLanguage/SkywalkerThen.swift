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

public extension Then where Self: AnyObject {
    @inlinable
    func then(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}

public extension Then where Self: Any {
    /// Makes it available to set properties with closures just after initializing and copying the value types
    @inlinable
    func with(_ block: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try block(&copy)
        return copy
    }

    @inlinable
    func `do`(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}

extension NSObject: Then {}
extension Array: Then {}
extension Dictionary: Then {}
extension Set: Then {}
extension JSONDecoder: Then {}
extension JSONEncoder: Then {}

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
