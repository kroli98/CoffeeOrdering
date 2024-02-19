//
//  ContentView.swift
//  CoffeeOrdering
//
//  Created by Kiss Roland on 07/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    var body: some View {
        
        NavigationView{
            
            OrderListView(orders: self.orderListVM.orders)
        }
       
      
       
    }
    
        
       
}


#Preview {
    ContentView()
}
