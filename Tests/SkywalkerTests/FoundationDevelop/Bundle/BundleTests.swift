//
//  BundleTests.swift
//  
//
//  Created by 杨俊艺 on 2022/3/22.
//

import XCTest
@testable import Skywalker

class BundleTests: XCTestCase {

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        return formatter
    }()
    
    var exampleJSONData: Data!
    var weather: WeatherbitData!
    
    override func setUpWithError() throws {
//        let bundle = Bundle(for: type(of: self))
        let url = Bundle.module.url(forResource: "WeatherbitExample", withExtension: "json")!
        exampleJSONData = try! Data(contentsOf: url)
      
        let decoder = JSONDecoder()
        weather = try! decoder.decode(WeatherbitData.self, from: exampleJSONData)
    }
    
    func testExample() throws {
        XCTAssertEqual(weather.currentTemp, 24.19)
        
        XCTAssertEqual(weather.iconName, "c03d")
        
        XCTAssertEqual(weather.description, "Broken clouds")
        
        // ⚠️Self
        XCTAssertEqual(Self.dateFormatter.string(from: weather.date), "08-28-2017")
        
    }

}

// https://openweathermap.org/current#current_JSON
// MARK: - 天气服务API返回的数据模型
struct WeatherbitData: Decodable {
    
    private static let dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
  
    enum CodingKeys: String, CodingKey {
        case observation = "data"
    }
  
    let observation: [Observation]
    
    struct Observation: Decodable {
        let temp: Double
        let datetime: String
    
        let weather: Weather
    
        struct Weather: Decodable {
            let icon: String
            let description: String
        }
    }
  
    var currentTemp: Double {
        observation[0].temp
    }
  
    var iconName: String {
        observation[0].weather.icon
    }
  
    var description: String {
        observation[0].weather.description
    }
  
    var date: Date {
        let dateString = String(observation[0].datetime.prefix(10))
        return Self.dateFormatter.date(from: dateString) ?? Date()
    }
    
}
