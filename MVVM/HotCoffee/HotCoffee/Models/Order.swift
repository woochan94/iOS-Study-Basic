//
//  Order.swift
//  HotCoffee
//
//  Created by 정우찬 on 2024/05/27.
//

import Foundation

enum CoffeType: String, Codable {
    case cappuccino
    case latte
    case espressino
    case cortado
}

enum CoffeSize: String, Codable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeType
    let size: CoffeSize
}
