//
//  CalculateWidth.swift
//  Brick
//
//  Created by Rivaldi Aliando on 29/11/20.
//

import SwiftUI

func calculateWidth()->CGFloat{
  
  // horizontal padding 50
  
  let screen = UIScreen.main.bounds.width - 50
  
  // going to show first three cards
  // all other will be hidden....
  
  // scnd and third will be moved x axis with 30 value..
  
  let width = screen - (2 * 30)
  
  return width
}
