//
//  UIViewControllerHierarchy.swift
//  
//
//  Created by 杨俊艺 on 2022/12/9.
//

import UIKit

@objc
public extension UIViewController {
    
    @discardableResult
    func addChildController(_ child: UIViewController?, bottomAnchor: NSLayoutYAxisAnchor? = nil) -> UIViewController? {
        guard let child = child else { return nil }
        
        if child.parent != nil {
            child.removeFromParentViewController()
        }
        
        child.willMove(toParent: self)
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.bottomAnchor.constraint(equalTo: bottomAnchor ?? view.bottomAnchor)
        ])
        
        return child
    }
    
    func removeFromParentViewController() {
        guard parent != nil else { return }
        
        DispatchQueue.main.async {
            self.willMove(toParent: nil)
            NSLayoutConstraint.deactivate(self.view.constraints)
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
}
