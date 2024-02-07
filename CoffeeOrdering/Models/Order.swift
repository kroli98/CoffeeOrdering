//
//  Order.swift
//  CoffeeOrdering
//
//  Created by Kiss Roland on 07/02/2024.
//

import Foundation

struct Order: Codable{
    
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
