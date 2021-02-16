//
//  AllGameEntity.swift
//  Brick
//
//  Created by Rivaldi Aliando on 07/12/20.
//

import Foundation
import RealmSwift

class AllGameEntity: Object {
 
  @objc dynamic var id: Int = 0
  @objc dynamic var name: String = ""
  @objc dynamic var released: String = ""
  @objc dynamic var backgroundImage: String = ""
  @objc dynamic var rating: Double = 0.0
  @objc dynamic var ratingTop: Int = 0
  @objc dynamic var show: Bool = false
  @objc dynamic var isFavorite: Bool = false
  
  override static func primaryKey() -> String? {
    return "id"
  }
 
}
