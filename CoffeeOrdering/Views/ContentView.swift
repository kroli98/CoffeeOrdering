//
//  ContentView.swift
//  CoffeeOrdering
//
//  Created by Kiss Roland on 07/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State var showModal: Bool = false
    var body: some View {
        
        NavigationView{
            
            OrderListView(orders: self.orderListVM.orders)
                .sheet(isPresented: $showModal, onDismiss: {
                    reloadOrders()
                }, content: {
                    AddCoffeeOrderView(isPresented: $showModal)
                })
                
                .navigationBarItems(leading: Button(action: reloadOrders){
                    Image(systemName: "arrow.clockwise")
                }, trailing: Button(action: showAddCoffeeOrderView){
                    Image(systemName: "plus")
                       
                })
                
        }
        
       
      
       
    }
    private func reloadOrders(){
        self.orderListVM.fetchOrders()
    }
    private func showAddCoffeeOrderView()
    {
        self.showModal = true
    }
    
        
       
}


#Preview {
    ContentView()
}
