//
//  ImageDownloader.swift
//  
//
//  Created by 杨俊艺 on 2022/7/6.
//

import UIKit

public enum DownloadError: Error {
    case emptyData
    case invalidImage
}

public class ImageDownloader {
    
    public static let shared = ImageDownloader()
    
    private init() {}
    
    public func downloadImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(DownloadError.emptyData))
                return
            }
            guard let image = UIImage(data: data) else {
                completion(.failure(DownloadError.invalidImage))
                return
            }
            completion(.success(image))
        }
        task.resume()
    }
}

// ImageDownloader.shared.downloadImage(forURL: url) { [weak self] result in
//    guard let self = self, let image = try? result.get() else { return }
// }
