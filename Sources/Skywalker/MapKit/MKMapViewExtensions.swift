//
//  File.swift
//
//
//  Created by 杨俊艺 on 2022/12/24.
//

import MapKit

public extension MKMapView {
    /// 当告诉地图要显示什么时给出纬度和经度就足以使地图居中
    /// - Parameters:
    ///   - location: 中心点
    ///   - regionRadius: 基于距离的南北和东西跨度默认1000米
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true) // 展示区域
    }

    /// 将地图定位到用户位置并限定范围大小
    /// - Parameters:
    ///   - latitudinalMeters: 纬度范围
    ///   - longitudinalMeters: 经度范围
    func centerToUserLocation(latitudinalMeters: CLLocationDistance = 500, longitudinalMeters: CLLocationDistance = 500) {
        let zoomRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: latitudinalMeters, longitudinalMeters: longitudinalMeters)
        setRegion(zoomRegion, animated: true)
    }
}
