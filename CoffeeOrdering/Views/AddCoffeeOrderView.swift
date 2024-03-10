//
//  AddCoffeeOrderView.swift
//  CoffeeOrdering
//
//  Created by Kiss Roland on 19/02/2024.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    @Binding var isPresented: Bool
    var body: some View {
        
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("INFORMATION").font(.body)){
                        TextField("Enter name", text: self.$addCoffeeOrderVM.name)
                        
                    }
                    Section(header: Text("Select Coffee").font(.body)){
                        
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name)
                        {
                            coffee in
                            
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                            
                        }
                    }
                    Section(header: Text("Select Coffee").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderVM.total)){
                        
                        Picker("", selection: self.$addCoffeeOrderVM.size)
                        {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }
                        .pickerStyle(.segmented)
                        
                    }
                    HStack{
                        Spacer()
                        
                        Button("Place order"){
                            self.addCoffeeOrderVM.placeOrder()
                        }
                        .frame(width: 200)
                        .frame(height: 50)
                        .background(.green)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .buttonStyle(.plain)
                        
                        Spacer()
                    }
                    
                    
                    
                }
                
            }
            .navigationTitle("Add Order")
        }
       
       
    }
        
}

#Preview {
    AddCoffeeOrderView(isPresented: .constant(false))
}

struct CoffeeCellView: View {
    
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        HStack{
            Image(coffee.imageURL)
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.leading,20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "")
                .padding()
        }
        .onTapGesture {
            self.selection = self.coffee.name
        }
        .onTapGesture {
            
        }
    }
}
