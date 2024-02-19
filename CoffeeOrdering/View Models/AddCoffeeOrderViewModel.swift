//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrdering
//
//  Created by Kiss Roland on 19/02/2024.
//

import Foundation

class AddCoffeeOrderViewModel : ObservableObject{
    
    private var webservice: WebService
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    var coffeeList: [CoffeeViewModel]{
        
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.webservice = WebService()
    }
    var total: Double{
        return calculateTotalPrice()
    }
    
    func placeOrder(){
        
        let order = Order(name: self.name, size: self.size, coffeeName: self.coffeeName, total: self.total)
        
        self.webservice.createCoffeeOrder(order: order){
            _ in
            
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[self.size]!
    }
    
    private func calculateTotalPrice() -> Double {
        
        let coffeeVM = coffeeList.first{$0.name == coffeeName}
        
        if let coffeVM = coffeeVM {
            return coffeVM.price * priceForSize()
        }
        else{
            return 0.0
        }
    }
}
