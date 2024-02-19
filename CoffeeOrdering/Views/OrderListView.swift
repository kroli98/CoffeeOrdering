//
//  OrderListView.swift
//  CoffeeOrdering
//
//  Created by Kiss Roland on 17/02/2024.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    var body: some View {
        
        List{
            ForEach(self.orders, id: \.id){
                order in
                HStack{
                    Image(order.coffeName)
                        .resizable()
                        .frame(maxWidth: 100)
                        .frame(maxHeight: 100)
                        .cornerRadius(16)
                    VStack(alignment: .center){
                        Text(order.name)
                            .font(.title)
                        
                
                        HStack
                        {
                            Text(order.coffeName)
                            
                            
                            Text(order.size)
                            
                        }
                        
                    }
                    .frame(maxHeight: .infinity)
                  
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
              
                
                
                
            }
        }
        .navigationTitle("Coffee Orders")
        
    }
}

#Preview {
    OrderListView(orders: [OrderViewModel(order: Order(name: "Mary", size: "Medium", coffeeName: "Regular", total: 3.0))])
}
