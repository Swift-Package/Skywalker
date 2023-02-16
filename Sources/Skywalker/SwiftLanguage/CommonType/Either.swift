//
//  Either.swift
//
//
//  Created by 杨俊艺 on 2022/11/28.
//

// UIKonf 2017 – Day 2 – Brandon Williams & Lisa Luo – Anything you can do, I can do better
import Foundation

public enum Either<A, B> {
    case left(A)
    case right(B)
}

public extension Either {
    func map<C>(_ f: (B) -> C) -> Either<A, C> {
        switch self {
        case let .left(value): return .left(value)
        case let .right(value): return .right(f(value))
        }
    }
}
