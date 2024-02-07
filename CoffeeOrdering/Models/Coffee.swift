//
//  Coffee.swift
//  CoffeeOrdering
//
//  Created by Kiss Roland on 07/02/2024.
//

import Foundation

struct Coffee: Identifiable{
    var id = UUID()
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee {
    
    static func all() -> [Coffee]{
        
        return [Coffee(name: "Csppuccino", imageURL: "Cappucino", price: 2.5), Coffee(name: "Espresso", imageURL: "Espresso", price: 2.1), Coffee(name: "Regular", imageURL: "Regular", price: 1.0)]
    }
}
