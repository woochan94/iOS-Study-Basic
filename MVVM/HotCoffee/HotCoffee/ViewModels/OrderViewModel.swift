//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by 정우찬 on 2024/05/30.
//

import Foundation

class OrderListViewModel {
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
    
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
}

struct OrderViewModel {
    let order: Order
    
    var name: String {
        return self.order.name
    }
    var email: String {
        return self.order.email
    }
    var type: String {
        return self.order.type.rawValue.capitalized
    }
    var size: String {
        return self.order.size.rawValue.capitalized
    }
}
