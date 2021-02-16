//
//  APICall.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import Foundation

struct API {

  static let baseUrl = "https://api.rawg.io/api/games?key=3abe363fdfda48d482a7ccda1c0071f5&"

}

func date() -> (currentDate: String, date30DaysAgo: String) {
    let currentDate = Date()
    var dateComponent = DateComponents()
    dateComponent.month = -1
    let date30DaysAgo = Calendar.current.date(byAdding: dateComponent, to: currentDate)
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    
    let currentDateString = formatter.string(from: currentDate)
    let date30DaysAgoString = formatter.string(from: date30DaysAgo ?? Date())
    
    return (currentDateString, date30DaysAgoString)
}

protocol Endpoint {

  var url: String { get }

}

enum Endpoints {
  
  enum Gets: Endpoint {
    
    case all
    case latest
    case genre
    case search
    
    public var url: String {
      switch self {
      case .all: return "\(API.baseUrl)"
      case .latest: return "\(API.baseUrl)dates=\(date().date30DaysAgo),\(date().currentDate)"
      case .genre: return "\(API.baseUrl)genres="
      case .search: return "\(API.baseUrl)search.php?s="
      }
    }
  }
  
}
