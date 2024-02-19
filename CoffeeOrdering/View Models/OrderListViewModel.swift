//
//  OrderListViewModel.swift
//  CoffeeOrdering
//
//  Created by Kiss Roland on 07/02/2024.
//

import Foundation

class OrderListViewModel: ObservableObject{
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders(){
        
        WebService().getAllOrders {
            orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
    
}

class OrderViewModel {
    
    let id = UUID()
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return order.name
    }
    var size: String {
        return order.size
    }
    var coffeName: String {
        return order.coffeeName
    }
    var total: Double {
        return order.total
    }
}
