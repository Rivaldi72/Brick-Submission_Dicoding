//
//  GameModel.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import SwiftUI
import Foundation

struct GameModel: Equatable, Identifiable {
  let id: Int
  let name: String
  let released: String
  let backgroundImage: String
  let rating: Double
  let ratingTop: Int
  var show: Bool
  var isFavorite: Bool
//  let genre: []
}
