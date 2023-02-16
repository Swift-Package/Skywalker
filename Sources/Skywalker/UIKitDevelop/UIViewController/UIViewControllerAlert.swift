//
//  File.swift
//
//
//  Created by 杨俊艺 on 2022/11/10.
//

import UIKit

@objc
public extension UIViewController {
    func confirmAlert(title: String, message: String) {
        let confirmAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "确定", style: .default)
        confirmAlert.addAction(confirmAction)
        confirmAlert.view.tintColor = .green
        present(confirmAlert, animated: true)
    }

    func presentActionAlert(title: String, message: String, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        alert.view.tintColor = .green
        present(alert, animated: true)
    }
}
