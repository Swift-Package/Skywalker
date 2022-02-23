//
//  WKWebViewExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/2/23.
//

import Foundation
import WebKit

extension WKWebView {
    func load(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }

        let request = URLRequest(url: url)
        load(request)
    }
}
