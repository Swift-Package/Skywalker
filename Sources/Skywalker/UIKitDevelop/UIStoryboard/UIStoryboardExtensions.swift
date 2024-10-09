//
//  UIStoryboardExtensions.swift
//
//
//  Created by 杨俊艺 on 2022/2/23.
//

import UIKit

public enum Storyboard {
    case main

    var filename: String {
        switch self {
        case .main: return "Main"
        }
    }
}

public protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension UIViewController: StoryboardIdentifiable {
    public static var storyboardIdentifier: String { String(describing: self) }
}

public extension UIStoryboard {
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }

    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }

    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        return viewController
    }
}

protocol UIViewControllerCreatable {}

extension UIViewControllerCreatable where Self: UIViewController {
    static func create(of storyboard: Storyboard) -> Self {
        return UIStoryboard(storyboard: storyboard).instantiateViewController()
    }
}

extension UIViewController: UIViewControllerCreatable {}

// let viewController = MainViewController.create(of: .main)
