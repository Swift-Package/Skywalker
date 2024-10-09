//
//  RxPHPhotoLibraryAuth.swift
//
//
//  Created by 杨俊艺 on 2023/11/29.
//

import Foundation
import Photos
import RxSwift

extension PHPhotoLibrary {
    static var authorized: Observable<Bool> {
        return Observable.create { observer in
            if authorizationStatus() == .authorized {
                observer.onNext(true)
                observer.onCompleted()
            } else {
                observer.onNext(false)
                requestAuthorization { newStatus in
                    observer.onNext(newStatus == .authorized)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
